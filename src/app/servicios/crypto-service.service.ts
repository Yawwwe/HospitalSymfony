import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class CryptoServiceService {

  private url:string = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=15&page=1&sparkline=false'
  private cryptos:any
  private flag:number = 0;
  private wallet:Array<any> = []
  constructor(private http:HttpClient) {
    let walletGuardada = localStorage.getItem('wallet')

    if(walletGuardada){
      this.wallet = JSON.parse(walletGuardada)
    }
  }


  getAllCryptos():Array<any>{
    if(!this.cryptos){
    while (this.flag<=2) {
      this.flag = this.flag + 1
        this.http.get(this.url).subscribe(
          (respuesta:any) => {
             this.cryptos = respuesta
              return this.cryptos
          }
        )}
    }
      return this.cryptos
  }

  Update(): void { 
    this.http.get(this.url).subscribe(
      (respuesta:any) => {
         this.cryptos = respuesta
         console.log(0)
         return this.cryptos
      }
  )}

  setCoinToWallet(coin:any){
    this.wallet.push(coin)
    localStorage.setItem('wallet', JSON.stringify(this.wallet))
  }

  getWallet(){
    return this.wallet
  }

  deleteCoinFromWallet(coin:any){
    let pos = this.wallet.lastIndexOf(coin)
    this.wallet.splice(pos, 1)
    localStorage.setItem('wallet', JSON.stringify(this.wallet))
  }

  upCoin(coin:any){
    let posCoin = this.wallet.indexOf(coin)
    
    if(posCoin!=0){
      let posCoinMenosUno = posCoin - 1
      let underCoin = this.wallet[posCoinMenosUno]

      this.wallet[posCoinMenosUno] = coin
      this.wallet[posCoin] = underCoin
    }
  }

  downCoin(coin:any){
    let posCoin = this.wallet.indexOf(coin)

    let posCoinMasUno = posCoin + 1
      let underCoin = this.wallet[posCoinMasUno]
      this.wallet[posCoinMasUno] = coin
      this.wallet[posCoin] = underCoin

  }


  setCantidadCoin(value:string, coin:any){
    let posCoin = this.wallet.indexOf(coin)
    this.wallet[posCoin].cantidad = value 
  }

  getCantidadCoin(coin:any){

    let posCoin = this.wallet.indexOf(coin)
    if(this.wallet[posCoin].cantidad!=null){
    }

  }

  

  
}
