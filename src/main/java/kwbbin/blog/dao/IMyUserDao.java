package kwbbin.blog.dao;

import kwbbin.blog.bean.MyUser;
import org.springframework.stereotype.Repository;

@Repository
public interface IMyUserDao {
	public void addUser(MyUser user);
	public void deleteUser(int id);
	public void updateUser(MyUser user);
	public MyUser searchUserById(int id);
	public String getNameByid(Integer id);
	public MyUser findMyUserByNameAndPassword(String userNumber, String password);
	public MyUser findMyUserByUserNumber(String userNumber);
	
}
