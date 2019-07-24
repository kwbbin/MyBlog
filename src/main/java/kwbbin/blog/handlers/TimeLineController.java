package kwbbin.blog.handlers;

import kwbbin.blog.bean.Timeline;
import kwbbin.blog.service.ITimelineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class TimeLineController {

    @Autowired
    ITimelineService service;

    public void setService(ITimelineService service) {
        this.service = service;
    }

    @RequestMapping("/timeline.do")
    public ModelAndView timeline(ModelAndView mv){
        List<Timeline> tl=service.getAllTimeline();
        mv.addObject("timeline",tl);
        mv.setViewName("jsp/timeline.jsp");

        return mv;
    };
}
