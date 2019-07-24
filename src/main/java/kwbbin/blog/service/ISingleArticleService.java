package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Reply;
import kwbbin.blog.bean.ReplyArticle;

import java.util.List;

public interface ISingleArticleService {
	public Article getArticleById(Integer id);
	public List<ReplyArticle> getReply(Integer num);
	public List<ReplyArticle> getReplyToUser();
	public void addReply(Reply reply);
	public void addReading(Integer id);
}
