package com.instantvet.app.service.impl;

import com.instantvet.app.dao.*;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;
import com.instantvet.app.service.GestionPaciente;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class GestionPacienteImpl implements GestionPaciente  {
        

        
		@Override
		public void insertarPaciente(Paciente pac) throws DAOExcepcion {

                PacienteDAO objPacienteDAO = new PacienteDAO();

            	objPacienteDAO.DAOinsertarPacientes(pac);
           }

		@Override
		public Paciente obtenerPaciente(int codigoPaciente) throws DAOExcepcion {
            	 
        	PacienteDAO dao = new PacienteDAO();
                return dao.obtenerPaciente(codigoPaciente);
        }
  
		@Override
		public void modificarPaciente(Paciente pac) throws DAOExcepcion {
                PacienteDAO dao = new PacienteDAO();
                
                PacienteDAO objPacienteDAO=new PacienteDAO();
//        		if(objPacienteDAO.DAOexistepaciente(pac.getCodigoPaciente())==0){
//        			objPacienteDAO.DAOinsertarPacientes(pac);
//        		}
//        		if(objPacienteDAO.DAOexistepaciente(pac.getCodigoPaciente())==1){
//        			objPacienteDAO.modificarPaciente(pac);
//        		}
        }

		@Override
		public List<Paciente> listarPacientes() throws DAOExcepcion {
                PacienteDAO objPacienteDAO = new PacienteDAO();
                return objPacienteDAO.listarPacientes();
        }
		
		@Override
		public List<Paciente> listarpacientesxcliente(int codcliente)
				throws DAOExcepcion {
			PacienteDAO objPacienteDAO = new PacienteDAO();
			return objPacienteDAO.listarpacientesxcliente(codcliente);
		}


}
