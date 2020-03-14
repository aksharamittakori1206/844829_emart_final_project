import { Injectable } from '@angular/core';
import { CanActivate,Router,ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { EmartService } from '../emart.service';



@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private emartService: EmartService,private _router: Router){}
  canActivate(route:ActivatedRouteSnapshot,state:RouterStateSnapshot):boolean {
    const buyerExist= !!this.emartService.existBuyer();
    const sellerExist= !!this.emartService.existSeller();
    if(buyerExist || sellerExist){
      return true
    }
    else{
      this._router.navigate([''])
      return false
    }

  }
}