package kwbbin.blog.handlers;


import kwbbin.blog.bean.MyUser;
import kwbbin.blog.service.IMyUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.Timestamp;


@Controller
//@RequestMapping("/test")
public class UserController {
	@Resource(name="MyUserService")
	private IMyUserService  service;
	private String code;//临时存储验证码

	public void setService(IMyUserService service) {
		this.service = service;
	}
	
	
	/*
	 * 用户注册功能，
	 * 带文件的表单上传，
	 * 以及把数据存入数据库
	 * **/
	@RequestMapping("/register.do")
	public String doRegister(String pageid,String page,String name,String email,@RequestParam MultipartFile img,String telephone,String password,String sex,String userNumber,HttpServletRequest request) throws Exception {
		
		MyUser user;
		Timestamp joinTime=new Timestamp(System.currentTimeMillis());
		int type=1;
		String logo=null;
		if(img!=null && !img.isEmpty()){
			//上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
			String realPath = request.getServletContext().getRealPath(File.separator + "uploadImges");
	       //获取文件名
	        String filename = img.getOriginalFilename();
	        //获取文件后缀名
	        String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
	        //给上传的文件起别名，有很多种方式
	        logo=String.valueOf(System.currentTimeMillis())+"."+extensionname;
	        //创建File对象，传入目标路径参数，和新的文件别名
	        File dir=new File(realPath,logo);
	        if (!dir.exists()){//如果dir代表的文件不存在，则创建它，
	            dir.mkdirs();//
	        }
	        //如果存在则直接执行下面操作
			System.out.println(dir.getPath());
	        img.transferTo(dir);//将上传的实体文件复制到指定目录uploadImges下
		}
		logo="uploadImges"+File.separator+logo;
        //将文件名赋值给实体类，然后一并存到数据库
        user=new MyUser(name, email, telephone, logo, password, sex, type, joinTime, userNumber);
        if(!service.findMyUSesrByUserNumber(userNumber)){
        	service.addMyUser(user);
        }

        request.getSession().setAttribute("user", user);

		if("index".equals(page)){
			return "redirect:/index.do";
		}else if("life".equals(page)){
			return "redirect:/life.do";
		}else if("study".equals(page)){
			return "redirect:/study.do";
		}else if("single".equals(page)){
			return "redirect:/SingleArticle.do?id="+pageid;
		}else{
			return "redirect:/index.do";
		}

	}
	
	
	
	
	/***
	 * 登录功能，
	 * 包括cookie登录(拦截器)
	 * 以及密码验证
	 * 
	 */
	@RequestMapping("/Login.do")
	public String doLoginFindSession(String pageid,String page,String userNumber,String password,HttpServletRequest request, HttpServletResponse response){
		if(request.getSession().getAttribute("user")==null){
			MyUser user=service.findMyUser(userNumber, password);
			request.getSession().setAttribute("user", user);
			Cookie cookie1 = new Cookie("loginUserNumber", userNumber);
			cookie1.setMaxAge(24 * 3600);
			response.addCookie(cookie1);
			Cookie cookie2 = new Cookie("loginPassword", password);
			cookie2.setMaxAge(24 * 3600);
			response.addCookie(cookie2);
			
		}

		System.out.println(page);

		if("index".equals(page)){
			return "redirect:/index.do";
		}else if("life".equals(page)){
			return "redirect:/life.do";
		}else if("study".equals(page)){
			return "redirect:/study.do";
		}else if("single".equals(page)){
			return "redirect:/SingleArticle.do?id="+pageid;
		}else{
			return "redirect:/index.do";
		}
	}
	
	/***
	 * 注销功能，
	 * 包括cookie删除
	 * 以及session user删除
	 * 
	 */
	@RequestMapping("/LoginOut.do")
	public String doLoginOut(String id,String page,HttpServletRequest request, HttpServletResponse response){
		Cookie newCookie1=new Cookie("loginUserNumber",null); //假如要删除名称为username的Cookie
		Cookie newCookie2=new Cookie("loginPassword",null);
		newCookie1.setMaxAge(0); //立即删除型
		newCookie1.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
		newCookie2.setMaxAge(0); //立即删除型
		newCookie2.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
		response.addCookie(newCookie1); //重新写入，将覆盖之前的
		response.addCookie(newCookie2); //重新写入，将覆盖之前的
		request.getSession().removeAttribute("user");

		//return "redirect:/index.do";
		if("index".equals(page)){
			return "redirect:/index.do";
		}else if("life".equals(page)){
			return "redirect:/life.do";
		}else if("study".equals(page)){
			return "redirect:/study.do";
		}else if("single".equals(page)){
			System.out.println("id"+id);
			return "redirect:/SingleArticle.do?id="+id;
		}else{
			return "redirect:/index.do";
		}
	}
	
	
/**
 * 生成登录验证码
 * 
 * */
	@ResponseBody
	@RequestMapping("/verificationCode.do")
	public String doCreateVerificationCode(HttpServletRequest request){
		String code="";
		String verificationCode=request.getParameter("verificationCode");
		if(verificationCode.equals("verificationCode")){
			code=getCode();
			return code;
		}
		
		return null;
		
	}
	
	@RequestMapping("/verifyUserAjax.do")
	@ResponseBody
	public String doVerifyUserAjax(@RequestParam("userNumber") String userNumber){
		if(service.findMyUSesrByUserNumber(userNumber)){
			return "false";
		}
			return("true");
			
	}
		
	
		
		
	/***
	 * 获取验证码函数
	 * (用于用户登录)
	 * 
	 * */
	public String getCode(){
		String code="";

		for(int i=0;i<4;i++){
			int codeNum=(int)(Math.random()*10)+48;//0-9;
			int bigLetter=(int)(Math.random()*26)+65;//大写字母
			int smallLetter=(int)(Math.random()*26)+97;//小写字母
			
			int radomNum=(int)(Math.random()*3)+1;
			
			if(radomNum==1){
				char let=(char) codeNum;
				code+=let;
			}else if(radomNum==2){
				char let=(char) bigLetter;
				code+=let;
			}else if(radomNum==3){
				char let=(char) smallLetter;
				code+=let;
			}
		}
		return code;
	}







}


