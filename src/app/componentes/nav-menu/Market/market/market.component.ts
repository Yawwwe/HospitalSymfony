import { Component } from '@angular/core';
import { CryptoServiceService } from 'src/app/servicios/crypto-service.service';

@Component({
  selector: 'app-market',
  templateUrl: './market.component.html',
  styleUrls: ['./market.component.css']
})
export class MarketComponent {
  private nombre:string ="0"
  private ID:string = "0"
  constructor(private CryptoService:CryptoServiceService){}

  getAllCryptos(){
    return this.CryptoService.getAllCryptos()
  }

  update(){
    return this.CryptoService.Update()
  }

  setNombreFiltro(nombreFiltro:string){
    this.nombre = nombreFiltro
  }

  setIDFiltro(ID:string){
    this.ID = ID
  }

  getIDFiltro(){
    return this.ID
  }

  getNombreFiltro(){
    return this.nombre
  }

}
