package com.lauracristina.redballoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedBalloonController {

    @RequestMapping("/")
    public String exibeHome() {
        return "telaInicial";
    }

    @RequestMapping("/dadosResponsavel")
    public String exibeResponsavel() {
        return "dadosResponsavel";
    }

    @RequestMapping("/dados")
    public String exibeAlunos() {
        return "dados";
    }

    @RequestMapping("/secretaria")
    public String exibeSecretaria() {
        return "secretaria";
    }
    @RequestMapping("/lista")
    public String exibeDados() {
        return "listar";
    }

}