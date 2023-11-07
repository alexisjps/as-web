import { Controller } from "@hotwired/stimulus"
import Chartkick from 'chartkick';
import Chart from 'chart.js/auto';

Chartkick.addAdapter(Chart);

export default class extends Controller {
  connect() {
    console.log("Graph controller connected");

    // Graphique du mois
    const monthData = JSON.parse(this.element.dataset.graphValues);
    console.log("Données du mois:", monthData);
    new Chartkick.PieChart("chart-month", monthData);

    // Graphique de l'année
    const yearElement = document.getElementById('chart-year');
    if (yearElement && yearElement.dataset.graphValues) {
      const yearData = JSON.parse(yearElement.dataset.graphValues);
      console.log("Données de l'année:", yearData);
      new Chartkick.PieChart("chart-year", yearData);
    }
  }
}