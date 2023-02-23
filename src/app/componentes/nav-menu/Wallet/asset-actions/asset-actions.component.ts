import { Component, Input } from '@angular/core';
import { CryptoServiceService } from 'src/app/servicios/crypto-service.service';

@Component({
  selector: 'app-asset-actions',
  templateUrl: './asset-actions.component.html',
  styleUrls: ['./asset-actions.component.css']
})
export class AssetActionsComponent {
constructor(private bd:CryptoServiceService){

}

@Input() coin:any

deleteCoinFromWallet(coin:any){
this.bd.deleteCoinFromWallet(coin)
}

upCoin(coin:any){
  this.bd.upCoin(coin)
}

downCoin(coin:any){
  this.bd.downCoin(coin)
}
}
