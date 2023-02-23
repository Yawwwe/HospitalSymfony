import { Component, Input } from '@angular/core';
import { CryptoServiceService } from 'src/app/servicios/crypto-service.service';

@Component({
  selector: 'app-crypto-card',
  templateUrl: './crypto-card.component.html',
  styleUrls: ['./crypto-card.component.css']
})
export class CryptoCardComponent {
  constructor(private bd:CryptoServiceService){
    
  }
@Input() crypto:any

setCoinToWallet(coin:any){
  this.bd.setCoinToWallet(coin)
}
}
