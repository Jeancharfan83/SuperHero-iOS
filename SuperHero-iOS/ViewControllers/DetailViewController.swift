import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var intelligenceBar: UIView!
    @IBOutlet weak var strengthBar: UIView!
    @IBOutlet weak var speedBar: UIView!
    @IBOutlet weak var durabilityBar: UIView!
    @IBOutlet weak var powerBar: UIView!
    @IBOutlet weak var combatBar: UIView!
    
    var superhero: Superhero!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configuración básica del superhéroe
        navigationItem.title = superhero.name
        nameLabel.text = superhero.name
        
        // Usamos la extensión para cargar la imagen desde la URL
        avatarImageView.loadFrom(url: superhero.image.url!)

        // Llenar las barras de progreso con los valores de PowerStats
        fillPowerStatsBars()
    }

    func fillPowerStatsBars() {
        // Asumimos que los valores de PowerStats están en formato de cadenas
        let powerStats = superhero.powerstats
        
        // Convertir las cadenas a enteros, si la conversión falla se establece en 0
        let intelligenceValue = Int(powerStats.intelligence) ?? 0
        let strengthValue = Int(powerStats.strength) ?? 0
        let speedValue = Int(powerStats.speed) ?? 0
        let durabilityValue = Int(powerStats.durability) ?? 0
        let powerValue = Int(powerStats.power) ?? 0
        let combatValue = Int(powerStats.combat) ?? 0
        
        // Llenar las barras de progreso con los valores de PowerStats
        animateBarProgress(for: intelligenceBar, with: intelligenceValue, color: UIColor(hex: "#4A90E2")) // Azul claro para inteligencia
        animateBarProgress(for: strengthBar, with: strengthValue, color: UIColor(hex: "#D32F2F")) // Rojo para fuerza
        animateBarProgress(for: speedBar, with: speedValue, color: UIColor(hex: "#FFEB3B")) // Amarillo para velocidad
        animateBarProgress(for: durabilityBar, with: durabilityValue, color: UIColor(hex: "#388E3C")) // Verde para durabilidad
        animateBarProgress(for: powerBar, with: powerValue, color: UIColor(hex: "#8E24AA")) // Púrpura para poder
        animateBarProgress(for: combatBar, with: combatValue, color: UIColor(hex: "#FF5722")) // Naranja para combate
    }

    // Función para animar el cambio de ancho de las barras con color
    func animateBarProgress(for bar: UIView, with value: Int, color: UIColor) {
        // Establecer el color de la barra
        bar.backgroundColor = color
        
        // Suponemos que las barras están dentro de un contenedor que tiene márgenes
        let labelWidth: CGFloat = 100  // Este es un valor de ejemplo, ajusta el valor según tu diseño
        let maxBarWidth = self.view.frame.width - labelWidth - 40  // Ajuste para considerar márgenes y el espacio ocupado por el label
        
        // Cálculo del ancho de la barra en función del valor (entre 0 y 100)
        let targetWidth = CGFloat(value) / 100.0 * maxBarWidth
        
        // Inicializar el ancho de la barra a 0 para la animación
        bar.frame.size.width = 0
        
        // Animar el cambio de ancho de la barra, asegurándose de que no exceda el máximo permitido
        UIView.animate(withDuration: 1.0, delay: 0.2, options: [.curveEaseInOut], animations: {
            bar.frame.size.width = min(targetWidth, maxBarWidth) // Asegúrate de que el ancho no exceda el máximo permitido
        }, completion: nil)
    }
}
