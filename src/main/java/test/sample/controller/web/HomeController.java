package test.sample.controller.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: HolyEyE
 * Date: 13. 9. 11. Time: ?��?�� 9:16
 */

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model) {
        return "redirect:/post/list";
    }
}
