package kwbbin.blog.dao;

import kwbbin.blog.bean.Reply;
import kwbbin.blog.bean.ReplyArticle;

import java.util.List;

public interface IReplyDao {
	public List<ReplyArticle> getAllReply(Integer num);
	public List<ReplyArticle> getAllReplyToUser();
	public void addReply(Reply reply);
}
