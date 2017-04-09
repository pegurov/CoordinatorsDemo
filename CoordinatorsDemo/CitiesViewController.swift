import UIKit

final class CitiesViewController: UITableViewController {

    // MARK: - Output -
    var onCitySelected: ((City) -> Void)?
    
    // MARK: - Private variables -
    private let cities: [City] = [City(name: "Moscow"),
                                  City(name: "Ulyanovsk"),
                                  City(name: "New York"),
                                  City(name: "Tokyo")]
    
    // MARK: - Table -
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        onCitySelected?(cities[indexPath.row])
    }
}
