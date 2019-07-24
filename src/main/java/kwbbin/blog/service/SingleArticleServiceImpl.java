package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.bean.Reply;
import kwbbin.blog.bean.ReplyArticle;
import kwbbin.blog.dao.IReplyDao;
import kwbbin.blog.dao.ISingleArticleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("SingleArticleService")
public class SingleArticleServiceImpl implements ISingleArticleService{
	@Resource(name="ISingleArticleDao")
	private ISingleArticleDao dao;
	@Resource(name="IReplyDao")
	private IReplyDao rdao;

	public void setDao(ISingleArticleDao dao) {
		this.dao = dao;
	}
	
	public void setRdao(IReplyDao rdao) {
		this.rdao = rdao;
	}

	public Article getArticleById(Integer id) {
		return dao.getArticleById(id);
	}

	public List<ReplyArticle> getReply(Integer num) {
		return rdao.getAllReply(num);
	}

	@Override
	public List<ReplyArticle> getReplyToUser() {
		return rdao.getAllReplyToUser();
	}


	public void addReply(Reply reply) {
		rdao.addReply(reply);
	}

	public void addReading(Integer id) {
		dao.addReading(id);
	}


}
