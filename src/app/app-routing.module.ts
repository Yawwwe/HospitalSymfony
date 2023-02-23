import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CreditsComponent } from './componentes/nav-menu/Credits/credits/credits.component';
import { Error404Component } from './componentes/nav-menu/Error404/error404/error404.component';
import { MarketComponent } from './componentes/nav-menu/Market/market/market.component';
import { WalletComponent } from './componentes/nav-menu/Wallet/wallet/wallet.component';

const routes: Routes = [
{path:'', redirectTo: '/Market', pathMatch:'full'},
{path:'Market', component:MarketComponent},
{path:'Wallet', component:WalletComponent},
{path:'Credits', component:CreditsComponent},
{path:'**', component:Error404Component}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
