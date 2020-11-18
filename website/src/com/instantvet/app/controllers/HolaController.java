package com.instantvet.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/accion")
public class HolaController {

	@RequestMapping(method=RequestMethod.GET)
	public String darNombre(){return "vane";}

	@ModelAttribute("Nombre")
	public String tomarNombre(@RequestParam("nombre")String nom )
	{return nom;}
	
	
	@ModelAttribute("Apellido")
	public String tomarApellido(@RequestParam("apepat")String ap )
	{return ap;}
	
	@ModelAttribute("Raza")
	public String tomarRaza(@RequestParam("raza")String raza )
	{return raza;}
	

	@RequestMapping(method=RequestMethod.POST)
	public String resultado(){return "exito";}

}
