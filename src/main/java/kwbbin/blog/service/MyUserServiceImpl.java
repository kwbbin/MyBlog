package kwbbin.blog.service;

import kwbbin.blog.bean.MyUser;
import kwbbin.blog.dao.IMyUserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

@Service("MyUserService")
public class MyUserServiceImpl implements IMyUserService{
	@Resource(name="IMyUserDao")
	private IMyUserDao dao;

	public void setDao(IMyUserDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	public void addMyUser(MyUser user){
		dao.addUser(user);
	}
	
	public void deleteMyUser(int id){
		dao.deleteUser(id);
	}
	
	public void updateMyUser(MyUser user){
		dao.updateUser(user);
	}
	
	public MyUser selectMyUserByid(int id){
		return dao.searchUserById(id);
	}

	public MyUser findMyUser(String name, String password) {
		return dao.findMyUserByNameAndPassword(name, password);
	}
	@Override
	public boolean findMyUSesrByUserNumber(String userNumber) {
		MyUser u=dao.findMyUserByUserNumber(userNumber);
		if(u==null){
			return false;
		}
		return true;
	}
	
	
	
}
