package com.instantvet.app.negocio;

import com.instantvet.app.dao.*;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class AdmGestionPaciente implements IPaciente  {
        

        /* (non-Javadoc)
		 * @see com.instantvet.app.negocio.IPaciente#insertarPaciente(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
		 */

		@Override
		public void insertarPaciente(Paciente pac) throws DAOExcepcion {

                PacienteDAO objPacienteDAO = new PacienteDAO();

            	objPacienteDAO.DAOinsertarPacientes(pac);
           }

        /* (non-Javadoc)
		 * @see com.instantvet.app.negocio.IPaciente#obtenerPaciente(java.lang.String)
		 */

		@Override
		public Paciente obtenerPaciente(int codigoPaciente) throws DAOExcepcion {
            	 
        	PacienteDAO dao = new PacienteDAO();
                return dao.obtenerPaciente(codigoPaciente);
        }

        /* (non-Javadoc)
		 * @see com.instantvet.app.negocio.IPaciente#deleteaciente(java.lang.String)
		 */
 
		@Override
		public void deletepaciente(int codigoPaciente) throws DAOExcepcion {
                PacienteDAO objPaciente = new PacienteDAO();
                objPaciente.eliminarPaciente(codigoPaciente);
        }

        /* (non-Javadoc)
		 * @see com.instantvet.app.negocio.IPaciente#GrabarModificarPaciente(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
		 */
  
		@Override
		public void GrabarModificarPaciente(Paciente pac) throws DAOExcepcion {
                PacienteDAO dao = new PacienteDAO();
                
                PacienteDAO objPacienteDAO=new PacienteDAO();
        		if(objPacienteDAO.DAOexistepaciente(pac.getCodigoPaciente())==0){
        			objPacienteDAO.DAOinsertarPacientes(pac);
        		}
        		if(objPacienteDAO.DAOexistepaciente(pac.getCodigoPaciente())==1){
        			objPacienteDAO.modificarPaciente(pac);
        		}
        }

      
        /* (non-Javadoc)
		 * @see com.instantvet.app.negocio.IPaciente#listarPacientes()
		 */

		@Override
		public List<Paciente> listarPacientes() throws DAOExcepcion {
                PacienteDAO objPacienteDAO = new PacienteDAO();
                return objPacienteDAO.listarPacientes();
        }


}
