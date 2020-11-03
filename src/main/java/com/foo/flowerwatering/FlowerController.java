package com.foo.flowerwatering;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FlowerController {

    @Autowired
    private FlowerService service;

    @RequestMapping(value = {"/", "/home"})
    public String home(Map<String, Object> model) {
        model.put("flowers", service.getAll());
        return "index";
    }
}
