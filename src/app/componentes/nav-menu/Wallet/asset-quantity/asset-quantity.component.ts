import { Component, Input } from '@angular/core';
import { CryptoServiceService } from 'src/app/servicios/crypto-service.service';

@Component({
  selector: 'app-asset-quantity',
  templateUrl: './asset-quantity.component.html',
  styleUrls: ['./asset-quantity.component.css']
})
export class AssetQuantityComponent {

@Input() coin:any

  constructor(private bd:CryptoServiceService){}



disableTextAreaAndPrice(textArea:any, coin:any){
  textArea.disabled = true
    this.bd.setCantidadCoin(textArea.value, coin)
  
}


changeButton(button:any){
  button.disabled = !button.disabled
}

}
