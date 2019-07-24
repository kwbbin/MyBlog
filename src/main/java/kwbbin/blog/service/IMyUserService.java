package kwbbin.blog.service;

import kwbbin.blog.bean.MyUser;

public interface IMyUserService {
	public void addMyUser(MyUser user);
	public void deleteMyUser(int id);
	public void updateMyUser(MyUser user);
	public MyUser selectMyUserByid(int id);
	public MyUser findMyUser(String name, String password);
	public boolean findMyUSesrByUserNumber(String userNumber);
}
