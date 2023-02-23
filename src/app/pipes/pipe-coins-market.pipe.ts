import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'porNombreEId'
})
export class PipeCoinsMarketPipe implements PipeTransform {

  transform(lista: any[], filtroNombre:string, filtroID:string):any[] {
    console.log(filtroNombre)
    if(filtroNombre != "0" && filtroID =="0"){
      return lista.filter(item => item.id.includes(filtroNombre))
    }

    if(filtroNombre == "0" && filtroID !="0"){
      return lista.filter(item => item.id = filtroID)
    }

    return lista
  }

}
