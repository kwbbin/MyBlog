package kwbbin.blog.service;

import kwbbin.blog.bean.Message;
import kwbbin.blog.dao.IMessageDao;
import kwbbin.blog.dao.IMyUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServiceImpl implements IMessageService{

    @Autowired
    private IMessageDao dao;
    @Autowired
    private IMyUserDao userDao;

    public void setDao(IMessageDao dao) {
        this.dao = dao;
    }


    public void addMessage(Message message) {
        dao.addMessage(message);
    }
    public int getMessageNum(double MessageSize) {
        return (int) Math.ceil(dao.getMessageSum()/MessageSize);
    }


    public List<Message> getMessage(int currPage, int MessageSize) {
        List<Message> students = dao.getAllMessage();
        List<Message> messages=new ArrayList<Message>();
        for (Message m:students) {
            m.setUserName(userDao.getNameByid(m.getUserId()));
            messages.add(m);
        }
        //从第几条数据开始
        int firstIndex = (currPage - 1) * MessageSize;
        //到第几条数据结束
        int lastIndex = currPage * MessageSize;
        int totalArticle=dao.getMessageSum();
        if(lastIndex>=totalArticle){
            lastIndex=totalArticle;
        }
        //System.out.println(dao.getMessageSum()+"   "+MessageSize);
        if(dao.getMessageSum()>=MessageSize){
            return messages.subList(firstIndex, lastIndex); //直接在list中截取
        }else{
            return messages.subList(firstIndex,dao.getMessageSum());
        }

    }
}
