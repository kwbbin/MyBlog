package kwbbin.blog.handlers;

import kwbbin.blog.bean.Message;
import kwbbin.blog.bean.MyUser;
import kwbbin.blog.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
public class MessageController {

    @Autowired
    private IMessageService service;

    public void setService(IMessageService service) {
        this.service = service;
    }


    /**
     * 留言分页查询
     * 得到5篇留言信息
     * */
    @RequestMapping("/Message.do")
    public ModelAndView doFindMessage(Integer pageNow,HttpServletRequest request, ModelAndView mv) throws Exception {

        List<Message> messages=service.getMessage(pageNow,7);
       // System.out.println(messages);
        mv.addObject("messages",messages);
        mv.setViewName("/jsp/Message.jsp");
        return mv;
    }

    @RequestMapping("/GetMessageSum.do")
    @ResponseBody
    public int doFindMessage(HttpServletRequest request) throws Exception {
        return service.getMessageNum(7);
    }

    @RequestMapping("/MessageContent.do")
    @ResponseBody
    public List<Message> doMessageAjax(Integer pageNow,HttpServletRequest request) throws Exception {
        List<Message> messages=service.getMessage(pageNow,7);
        System.out.println(messages);
        return messages;
    }

    @RequestMapping("/doMessage.do")
    public ModelAndView doReply(Integer id, String content, HttpServletResponse response, HttpServletRequest request, ModelAndView mv) throws Exception {
//		添加评论到数据库
        MyUser user= (MyUser) request.getSession().getAttribute("user");
        if(user==null){
            mv.addObject("login","shibai");
        }else{
            Date date=new Date(System.currentTimeMillis());
//            String content1= URLDecoder.decode(content,"UTF-8");
            Message message=new Message(content,date,id);

            service.addMessage(message);
        }
        mv.setViewName("/jsp/Message.jsp");
        return mv;
    }
}
