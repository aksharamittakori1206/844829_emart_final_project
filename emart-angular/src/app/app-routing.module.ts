import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ItemListComponent } from './emart/items/item-list/item-list.component';
import { ItemDisplayComponent } from './emart/items/item-display/item-display.component';
import { CartListComponent } from './emart/cart/cart-list/cart-list.component';
import { BillViewComponent } from './emart/bill/bill-view/bill-view.component';
import { BillListComponent } from './emart/bill/bill-list/bill-list.component';
import { LoginComponent } from './emart/user/login/login.component';
import { LogoutComponent } from './emart/logout/logout.component';
import { BuyerSignupComponent } from './emart/user/buyer-signup/buyer-signup.component';
import { SellerSignupComponent } from './emart/user/seller-signup/seller-signup.component';
import { AuthGuard } from './emart/auth.guard';
import { SellerItemListComponent } from './emart/seller/seller-item-list/seller-item-list.component';



const routes: Routes = [            {
                                      path: '',
                                      component: LoginComponent

                                    },
                                    {
                                      path: 'item-list',
                                      component: ItemListComponent,
                                      canActivate: [AuthGuard]


                                    },
                                    {
                                      path: 'seller-item-list',
                                      component: SellerItemListComponent,
                                      canActivate: [AuthGuard]


                                    },
                                    {
                                      path: 'item-display/:iId',
                                      component: ItemDisplayComponent,
                                      canActivate: [AuthGuard]
                                    },
                                    {
                                      path: 'cart-list',
                                      component: CartListComponent,
                                      canActivate: [AuthGuard]
                                    },
                                    {
                                      path: 'bill-view',
                                      component: BillViewComponent,
                                      canActivate: [AuthGuard]
                                    },
                                    {
                                      path: 'bill-list',
                                      component: BillListComponent,
                                      canActivate: [AuthGuard]
                                    },
                                    {
                                      path: 'buyer-signup',
                                      component: BuyerSignupComponent,
                                   
                                    },
                                    {
                                      path: 'seller-signup',
                                      component: SellerSignupComponent,
                                      
                                    },
                                    {
                                      path: 'logout',
                                      component: LogoutComponent
                                    }
                        ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
