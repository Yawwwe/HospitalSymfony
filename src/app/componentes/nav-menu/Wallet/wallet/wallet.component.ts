import { Component } from '@angular/core';
import { CryptoServiceService } from 'src/app/servicios/crypto-service.service';

@Component({
  selector: 'app-wallet',
  templateUrl: './wallet.component.html',
  styleUrls: ['./wallet.component.css']

})
export class WalletComponent {

constructor(private bd:CryptoServiceService){}

getWallet(){
  return this.bd.getWallet()
}

getPrecioWallet(){
  let contador = 0;
  this.bd.getWallet().forEach(element => {
    if(element.cantidad!=null){
      contador = contador + parseFloat(element.current_price) * parseFloat(element.cantidad)
    }else{
      contador = contador + parseFloat(element.current_price)
    }
  });
  return contador
}

deleteCoinFromWallet(coin:any){
  this.bd.deleteCoinFromWallet(coin)
}

}
