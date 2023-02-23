import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeadComponent } from './componentes/head/head.component';
import { NavMenuComponent } from './componentes/nav-menu/nav-menu.component';
import { FooterComponent } from './componentes/footer/footer.component';
import { WalletComponent } from './componentes/nav-menu/Wallet/wallet/wallet.component';
import { MarketComponent } from './componentes/nav-menu/Market/market/market.component';
import { CreditsComponent } from './componentes/nav-menu/Credits/credits/credits.component';
import { Error404Component } from './componentes/nav-menu/Error404/error404/error404.component';
import { HttpClientModule } from '@angular/common/http';
import { CryptoCardComponent } from './componentes/nav-menu/Market/market/crypto-card/crypto-card.component';
import { PipeCoinsMarketPipe } from './pipes/pipe-coins-market.pipe';
import { AssetQuantityComponent } from './componentes/nav-menu/Wallet/asset-quantity/asset-quantity.component';
import { AssetActionsComponent } from './componentes/nav-menu/Wallet/asset-actions/asset-actions.component';


@NgModule({
  declarations: [
    AppComponent,
    HeadComponent,
    NavMenuComponent,
    FooterComponent,
    WalletComponent,
    MarketComponent,
    CreditsComponent,
    Error404Component,
    CryptoCardComponent,
    PipeCoinsMarketPipe,
    AssetQuantityComponent,
    AssetActionsComponent,
   
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
