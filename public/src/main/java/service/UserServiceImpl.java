package service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import model.User;
import dao.UserDao;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional(readOnly = true)
	@Override
	public List<User> tuttiGliUtenti() {
		return this.userDao.tuttiGliUtenti();
	}

	@Transactional
	@Override
	public void insert(User user) {
		this.userDao.insert(user);
	}

	@Transactional
	@Override
	public void delete(User user) {
		this.userDao.delete(user);
	}

	@Transactional
	@Override
	public void update(User user) {
		this.userDao.update(user);
	}

	@Transactional(readOnly = true)
	@Override
	public User getUser(int id) {
		return this.userDao.getUser(id);
	}

}
