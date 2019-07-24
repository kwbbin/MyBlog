package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.dao.IFindArticleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;


@Service
public class FindArticleServiceImpl implements IFindArticleService {
	@Resource(name="IFindArticleDao")
	private IFindArticleDao dao;

	public void setDao(IFindArticleDao dao) {
		this.dao = dao;
	}
	
	/**
	 * 得到指定的几条文章数据
	 * */
	@Transactional
	public List<Article> findArticle(int currPage, int pageSize,String condition) {
		 List<Article> students =dao.FindArticle(condition);
	        //从第几条数据开始
	        int firstIndex = (currPage - 1) * pageSize;
	        //到第几条数据结束
	        int lastIndex = currPage * pageSize;
	        int totalArticle=dao.findArticleNum(condition);
	        if(lastIndex>=totalArticle){
	        	lastIndex=totalArticle;
	        }
	        return students.subList(firstIndex, lastIndex); //直接在list中截取
	}


	public int getFindPageNum(double pageSize,String condition) {
		return (int) Math.ceil(dao.findArticleNum(condition)/pageSize);
	}

}
