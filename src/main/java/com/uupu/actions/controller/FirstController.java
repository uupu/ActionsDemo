package com.uupu.actions.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author: qgf
 * @email: maxim.qgf@bitsun-inc.com
 * @date: 2021/3/22 5:12 下午
 */
@RestController
@RequestMapping("/first")
public class FirstController {

    @GetMapping(produces = {"application/json"})
    public String helloActions() {
        return "Hello!Actions!真TM不容易！WCCCCCCCCC!";
    }
}
