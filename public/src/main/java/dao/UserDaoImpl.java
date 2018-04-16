package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import model.User;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;
	
	public UserDaoImpl(){}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<User> tuttiGliUtenti() {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		List<User> users = crit.list();
		return users;
	}

	@Override
	public void insert(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(user);
	}

	@Override
	public void delete(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(user);
	}

	@Override
	public void update(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(user);
	}

	@Override
	public User getUser(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class)
				.add(Restrictions.eq("id", id));
		User user = (User) crit.uniqueResult();
		return user;
	}

}
