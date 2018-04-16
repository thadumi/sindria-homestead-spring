package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.User;
import service.UserService;

@Controller
public class UserController {

	@Autowired
	private ApplicationContext context;
	private UserService myUserService;
	
	@RequestMapping(path = "insertUser", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute User user, Model model){
		myUserService = context.getBean("myUserService", UserService.class);
		myUserService.insert(user);
		List<User> users = myUserService.tuttiGliUtenti();
		model.addAttribute("users", users);
		return "users";
	}
	
	@RequestMapping(path = "/pageUpdateUser", method = RequestMethod.GET)
	public String pageUpdateUser(@RequestParam int id, Model model){
		myUserService = context.getBean("myUserService", UserService.class);
		User user = myUserService.getUser(id);
		model.addAttribute("user", user);
		return "updateUser";
	}
	
	@RequestMapping(path = "/updateUser", method = RequestMethod.POST)
	public String updatateUser(@ModelAttribute User user, Model model){
		myUserService = context.getBean("myUserService", UserService.class);
		myUserService.update(user);
		List<User> users = myUserService.tuttiGliUtenti();
		model.addAttribute("users", users);
		return "users";
	}
	
	@RequestMapping(path = "/showAllUsers", method = RequestMethod.GET)
	public String showAllUsers(Model model){
		myUserService = context.getBean("myUserService", UserService.class);
		List<User> users = myUserService.tuttiGliUtenti();
		model.addAttribute("users", users);
		return "users";
	}
	
	@RequestMapping(path = "/deleteUser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam int id, Model model){
		myUserService = context.getBean("myUserService", UserService.class);
		User user = myUserService.getUser(id);
		myUserService.delete(user);
		List<User> users = myUserService.tuttiGliUtenti();
		model.addAttribute("users", users);
		return "users";
	}
	
	@RequestMapping(path = "/findUserByID", method = RequestMethod.POST)
	public String findUserById(@RequestParam("id") int id, Model model){
		myUserService = context.getBean("myUserService", UserService.class);
		User user = myUserService.getUser(id);
		model.addAttribute("user", user);
		return "user";
	}
}