package kwbbin.blog.dao;

import kwbbin.blog.bean.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMessageDao {
    public void addMessage(Message message);
    public List<Message> getAllMessage();
    public int getMessageSum();
}
