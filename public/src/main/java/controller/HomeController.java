package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.User;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(){
		return "home";
	}
	
	@RequestMapping(value = "/pageFindByISBN", method = RequestMethod.GET)
	public String findByISBN(){
		return "findByISBN";
	}
	
	@RequestMapping(value = "/registerUser", method = RequestMethod.GET)
	public String registraUtente(@ModelAttribute User user, Model model){
		model.addAttribute("user", new User());
		return "registerUser";
	}
	
	@RequestMapping(value = "/pageFindUser", method = RequestMethod.GET)
	public String findUserById(){
		return "findUser";
	}
	
}

