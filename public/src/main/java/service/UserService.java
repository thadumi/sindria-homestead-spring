package service;

import java.util.List;

import model.User;

public interface UserService {

	public List<User> tuttiGliUtenti();
	public void insert(User user);
	public void delete(User user);
	public void update(User user);
	public User getUser(int id);
	
}
