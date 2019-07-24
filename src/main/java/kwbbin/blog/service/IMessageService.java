package kwbbin.blog.service;

import kwbbin.blog.bean.Message;

import java.util.List;

public interface IMessageService{
    public void addMessage(Message message);
    public int getMessageNum(double MessageSize);
    public List<Message> getMessage(int currPage, int MessageSize);
}
