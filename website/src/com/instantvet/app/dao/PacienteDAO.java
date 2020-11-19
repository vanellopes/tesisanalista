package com.instantvet.app.dao;

        import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;
import com.instantvet.app.util.ConexionBD;

import java.sql.CallableStatement;
        import java.sql.Connection;
        import java.sql.PreparedStatement;
        import java.sql.ResultSet;
        import java.sql.SQLException;
        import java.sql.Types;
        import java.util.ArrayList;
        import java.util.List;

public class PacienteDAO extends BaseDAO {      
        

		     public Paciente DAOinsertarPacientes(Paciente objPaciente) throws DAOExcepcion {
		            String query = "INSERT INTO PACIENTE(nombre, clienteId, EspecieId,Genero, Esterilizado,peso,fechaNacimiento,observaciones, estado) values (?,?,?,?,?,?,?,?,?,?)";
		            Connection con = null;
		            PreparedStatement stmt = null;
		            ResultSet rs = null;
		            try {
		                    con = ConexionBD.obtenerConexion();
		                    stmt = con.prepareStatement(query);
		                    stmt.setString(1, objPaciente.getNombre());                            
                            stmt.setInt(2, objPaciente.getCodigoCliente());
                            stmt.setInt(3, objPaciente.getEstecieId());                            
                            stmt.setString(4, objPaciente.getGenero());
                            stmt.setString(5, objPaciente.getEsterilizado());
                            stmt.setString(6, objPaciente.getPeso());
                            java.sql.Timestamp sqlDate =new java.sql.Timestamp(objPaciente.getFechaNacimiento().getTime());
                			stmt.setTimestamp(7, sqlDate);
                            stmt.setString(8, objPaciente.getObservaciones());
                            stmt.setInt(9, objPaciente.getEstado());

		
		                    int i = stmt.executeUpdate();
		                    if (i != 1) {
		                            throw new SQLException("No se pudo insertar");
		                    }
		
		            } catch (SQLException e) {
		                    System.err.println(e.getMessage());
		                    throw new DAOExcepcion(e.getMessage());
		            } finally {
		                    this.cerrarResultSet(rs);
		                    this.cerrarStatement(stmt);
		                    this.cerrarConexion(con);
		            }
		            return objPaciente;
		    }
		
		
		     public Paciente obtenerPaciente(int codigoPaciente) throws DAOExcepcion {
		
		    	Paciente objPaciente = new Paciente();
		            Connection con = null;
		            PreparedStatement stmt = null;
		            ResultSet rs = null;
		            try {
		                    con = ConexionBD.obtenerConexion();
		
		         			CallableStatement cstm = null;
		           			cstm =  con.prepareCall("{call UP_GetPaciente(?)}");
		           			cstm.setInt(1, codigoPaciente);
		           			rs = cstm.executeQuery();
		
		                    if (rs.next()) {
		//                                        objPaciente.setCodigoPaciente(rs.getInt(1));
		//                                        objPaciente.setCodigoDueno(rs.getInt(2));
		//                                        objPaciente.setnombrePaciente(rs.getString(3));
		//                                        objPaciente.setespecieid(rs.getInt(4));
		//                                        objPaciente.setEspecie(rs.getString(5));
		//                                        objPaciente.setRaza(rs.getString(7));
		//                                        
		//                                        objPaciente.setgeneroid(rs.getInt(8));
		//                                        objPaciente.setGenero(rs.getString(9));
		//                                        
		//                                      
		//                                        objPaciente.setTipoSangre(rs.getString(10));
		//                                        
		//                                        objPaciente.setEsterilizado(rs.getString(11));
		//                                        
		//                                        objPaciente.settamanoid(rs.getInt(12));
		//                                        objPaciente.setTamano(rs.getString(13));
		//                                        objPaciente.setactividadid(rs.getInt(14));
		//                                        objPaciente.setActividad(rs.getString(15));
		//                                        objPaciente.setPeso(rs.getString(16));
		//                                        objPaciente.setFechaNacimiento(rs.getString(17));
		//                                        objPaciente.setNotasMedicas(rs.getString(18));
		//                                        objPaciente.setCondicionesEspeciales(rs.getString(19));
		                    }
		            } catch (SQLException e) {
		                    System.err.println(e.getMessage());
		                    throw new DAOExcepcion(e.getMessage());
		            } finally {
		                    this.cerrarResultSet(rs);
		                    this.cerrarStatement(stmt);
		                    this.cerrarConexion(con);
		            }
		            return objPaciente;
		    }
		
		    public void eliminarPaciente(int codigoPaciente) throws DAOExcepcion {
		            String query = "delete from paciente WHERE Paciente_Id=?";
		            Connection con = null;
		            PreparedStatement stmt = null;
		            try {
		                    con = ConexionBD.obtenerConexion();
		                    stmt = con.prepareStatement(query);
		                    stmt.setInt(1, codigoPaciente);
		                    int i = stmt.executeUpdate();
		                    if (i != 1) {
		                            throw new SQLException("No se pudo eliminar");
		                    }
		            } catch (SQLException e) {
		                    System.err.println(e.getMessage());
		                    throw new DAOExcepcion(e.getMessage());
		            } finally {
		                    this.cerrarStatement(stmt);
		                    this.cerrarConexion(con);
		            }
		    }
		
		    public Paciente modificarPaciente(Paciente objPaciente) throws DAOExcepcion {
		            String query = "update paciente set Dueno_Id=?,Especie_Id=?,Raza_Id=?,Genero_Id=?,TipoSangre_Id=?,Esterilizado=?,Tamano_Id=?,Actividad_Id=?,peso=?,fechaNacimiento=?,NotasMedicas=?,CondicionesEspeciales=? where Paciente_Id=?";
		                Connection con = null;
		                PreparedStatement stmt = null;
		
		                try {
		                        con = ConexionBD.obtenerConexion();
		                        stmt = con.prepareStatement(query);
		   
		//                                stmt.setInt(1, objPaciente.getCodigoDueno());                          
		//                                stmt.setInt(2, objPaciente.getespecieid());
		//                                stmt.setInt(4, objPaciente.getgeneroid());
		//                                stmt.setString(6, objPaciente.getEsterilizado());
		//                                stmt.setInt(7, objPaciente.gettamanoid());
		//                                stmt.setInt(8, objPaciente.getactividadid());
		//                                stmt.setString(9, objPaciente.getPeso());
		//                                stmt.setString(10, objPaciente.getFechaNacimiento());
		//                                stmt.setString(11, objPaciente.getNotasMedicas());
		//                                stmt.setString(12, objPaciente.getCondicionesEspeciales());
		//                                stmt.setInt(13, objPaciente.getCodigoPaciente());
		                    int i = stmt.executeUpdate();
		                    if (i != 1) {
		                            throw new SQLException("No se pudo actualizar");
		                    }
		            } catch (SQLException e) {
		                    System.err.println(e.getMessage());
		                    throw new DAOExcepcion(e.getMessage());
		            } finally {
		                    this.cerrarStatement(stmt);
		                    this.cerrarConexion(con);
		            }
		            return objPaciente;
		    }
		
		    public List<Paciente> listarPacientes() throws DAOExcepcion {
		        List<Paciente> lista = new ArrayList<Paciente>();
		            Connection con = null;
		            PreparedStatement stmt = null;
		            ResultSet rs = null;
		            try {
		                  con = ConexionBD.obtenerConexion();
		
		       			  CallableStatement cstm = null;
		       		    
		       			  cstm =  con.prepareCall("{call UP_ListarPaciente()}");
		       			  rs = cstm.executeQuery();
		
		                    while (rs.next()) {
		                            Paciente oPaciente = new Paciente();
		                            oPaciente.setNombre(rs.getString("nombre"));
		                            oPaciente.setCodigoPaciente(rs.getInt("PacienteId"));
		                            oPaciente.setEspecie(rs.getString("Especie"));
		                            oPaciente.setGenero(rs.getString("Genero"));
		                            oPaciente.setNombreCliente(rs.getString("nombreCliente"));
		                                lista.add(oPaciente);
		                        }
		
		                } catch (SQLException e) {
		                        System.err.println(e.getMessage());
		                        throw new DAOExcepcion(e.getMessage());
		                } finally {
		                        this.cerrarResultSet(rs);
		                        this.cerrarStatement(stmt);
		                        this.cerrarConexion(con);
		                }
		                return lista;
		        }
		
		   
		    	public int DAOexistepaciente(int codigo) throws DAOExcepcion {
		    		String query = "select count(*) as contador from Paciente where  Paciente_Id=?";
				Connection con = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				int contadorCliente=0;
				try {
					
					con = ConexionBD.obtenerConexion();
					stmt = con.prepareStatement(query);
					stmt.setInt(1, codigo);
					rs = stmt.executeQuery();
					while (rs.next()) {
						contadorCliente = rs.getInt("contador");
					}
					
				} catch (SQLException e) {
					System.err.println(e.getMessage());
					throw new DAOExcepcion(e.getMessage());
				} finally {
					this.cerrarResultSet(rs);
					this.cerrarStatement(stmt);
					this.cerrarConexion(con);
				}
				return contadorCliente;
			}
			
		    public List<Control> GetDataCombo(String Entidad) throws DAOExcepcion {
		        List<Control> lista = new ArrayList<Control>();
		            Connection con = null;
		            PreparedStatement stmt = null;
		            ResultSet rs = null;
		            try {
		                    con = ConexionBD.obtenerConexion();
		         			CallableStatement cstm = null;
		           			cstm =  con.prepareCall("{call UP_GetCombo(?)}");
		           			cstm.setString(1, Entidad);
		           			rs = cstm.executeQuery();
		       			 	
		                    while (rs.next()) {
		                            Control oControl = new Control();
		                            oControl.setCodigo(rs.getInt("id"));
		                            oControl.setNombre(rs.getString("nombre"));
		                            lista.add(oControl);
		                    }
		
		            } catch (SQLException e) {
		                    System.err.println(e.getMessage());
		                    throw new DAOExcepcion(e.getMessage());
		            } finally {
		                    this.cerrarResultSet(rs);
		                    this.cerrarStatement(stmt);
		                    this.cerrarConexion(con);
		            }
		            return lista;
		    }
		    
		public List<Paciente> listarpacientesxcliente(int codcliente) throws DAOExcepcion {
			String query = "Select p.pacienteId, p.nombre, e.Nombre as especie, p.genero, p.clienteId, " +
					       "p.peso, p.fechaNacimiento, p.Esterilizado, p.observaciones " +
		    			   "from paciente p " +
		    			   "join especie e on (p.especieId = e.especieId ) " +
		    			   "where p.clienteId =? and p.estado =1 ";
		List<Paciente> lista = new ArrayList<Paciente>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, codcliente);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Paciente objPaciente = new Paciente();        			
				objPaciente.setCodigoPaciente(rs.getInt("PacienteId"));
				objPaciente.setNombre(rs.getString("nombre"));
				objPaciente.setEspecie(rs.getString("especie"));
				objPaciente.setGenero(rs.getString("genero"));
				objPaciente.setPeso(rs.getString("peso"));
				objPaciente.setFechaNacimiento(rs.getTimestamp("fechaNacimiento"));
				objPaciente.setEsterilizado(rs.getString("Esterilizado")); 
				objPaciente.setObservaciones(rs.getString("observaciones")); 
				objPaciente.setCodigoCliente(rs.getInt("clienteId")); 
		        			lista.add(objPaciente);
		        		}
		        	} catch (SQLException e) {
		        		System.err.println(e.getMessage());
		        		throw new DAOExcepcion(e.getMessage());
		        	} finally {
		        		this.cerrarResultSet(rs);
		        		this.cerrarStatement(stmt);
		        		this.cerrarConexion(con);
		        	}
		        	System.out.println(lista.size());
		        	return lista;
		        	}
		}
