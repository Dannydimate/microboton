package com.semillero.rest.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.semillero.rest.dto.internal.ResponseData;

@Controller
public class RestController {
    @GetMapping("/boton")
    public ResponseEntity<ResponseData> getMessage(){
        return ResponseEntity.ok(ResponseData.builder().code(200).mensaje("Hola soy el boton!").build());
    }
}
