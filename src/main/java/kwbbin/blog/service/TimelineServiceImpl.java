package kwbbin.blog.service;

import kwbbin.blog.bean.Timeline;
import kwbbin.blog.dao.ITimelineDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TimelineServiceImpl implements ITimelineService{
    @Autowired
    ITimelineDao dao;

    public void setDao(ITimelineDao dao) {
        this.dao = dao;
    }


    public List<Timeline> getAllTimeline() {
        return dao.getAllTimeline();
    }
}
