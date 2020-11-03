package com.foo.flowerwatering;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/flowers")
public class FlowerRestController {

    @Autowired
    private FlowerService service;

    @PostMapping("/create")
    public void create(@RequestBody Flower flower) {
        service.create(flower);
    }

    @PostMapping("/delete/{id}")
    public void delete(@PathVariable Integer id) {
        service.delete(id);
    }

    @GetMapping("/{id}")
    public Flower get(@PathVariable Integer id) {
        return service.get(id);
    }

    @PostMapping("/update/{id}")
    public void update(@PathVariable Integer id, @RequestBody Flower flower) {
        service.update(id, flower);
    }
}
