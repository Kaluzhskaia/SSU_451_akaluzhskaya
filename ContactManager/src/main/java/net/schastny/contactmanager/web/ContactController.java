package net.schastny.contactmanager.web;

import java.util.List;
import java.util.Map;

import net.schastny.contactmanager.dao.ContactDAO;
import net.schastny.contactmanager.domain.Contact;
import net.schastny.contactmanager.service.ContactService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;

	@Autowired
	private ContactDAO contactDao;

	@RequestMapping("/index")
	public String listContacts(Map<String, Object> map) {

		map.put("contact", new Contact());
		map.put("contactList", contactService.listContact());

		return "contact";
	}


	@RequestMapping("/")
	public String begin() {
		return "redirect:/home";
	}




	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("contact") Contact contact,
			BindingResult result) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		String username = userDetail.getUsername();
		contact.setUser(username);
		contactService.addContact(contact);

		return "redirect:/mypage";
	}

	@RequestMapping("/deleteUser/{contactId}")
	public String deleteContactUser(@PathVariable("contactId") Integer contactId) {

		contactService.removeContact(contactId);

		return "redirect:/mypage";
	}



	@RequestMapping("/deleteAdmin/{contactId}")
	public String deleteContactAdmin(@PathVariable("contactId") Integer contactId) {

		contactService.removeContact(contactId);

		return "redirect:/index";
	}

	@RequestMapping("/login")
	public String getLogin()
	{
	return "login";
	}

	@RequestMapping("/mypage")
	public ModelAndView getMyProfile() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		String username = userDetail.getUsername();
		System.out.println(username);

		List<Contact> list = contactDao.getUserContacts(username);
		ModelAndView model;

		model = new ModelAndView("mypage");
			model.addObject("list", list);
		model.addObject("contact", new Contact());
		return model;
	}


}



