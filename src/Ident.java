

public class Ident {
	
	private String type;
	private String nombre;
	
	public Ident(String nombre, String type) {
		this.type = type;
		this.nombre = nombre;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}
