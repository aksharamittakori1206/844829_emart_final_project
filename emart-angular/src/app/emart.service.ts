import { Injectable } from '@angular/core';
import { Category } from './emart/Category';
import { SubCategory } from './emart/Subcategory';
import { Item } from './emart/Item';
import { Bill } from './emart/Bill';
import { Seller } from './emart/Seller';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Buyer } from './emart/Buyer';

@Injectable({
  providedIn: 'root'
})

export class EmartService {
  loggedIn: any;
  getAllBuyers() {
    throw new Error("Method not implemented.");
  }
  categories: Category[];
  subCategories: SubCategory[];
  allItems: Item[];
  cartItems: Item[];
  allBills: Bill[];
  allBuyers: any;
  allSellers: Seller[];
  currentBuyer: any;
  currentSeller: any;
  constructor(protected Http: HttpClient) {
    this.allBills = [];
    this.cartItems = [];
  }

  /*To display allitems by retriving from database*/
  getAllItems(): any {
    return this.Http.get("http://localhost:8083/BuyerItemService/item/all");
  }

  getItem(itemId: String) {
    return this.Http.get("http://localhost:8083/BuyerItemService/item/" + itemId);
  }
  addBuyer(buyer: Buyer) {
    return this.Http.post("http://localhost:8083/BuyerSignupService/buyer", buyer);
  }
  addSeller(seller: Seller) {
    return this.Http.post("http://localhost:8083/SellerSignupService/emart/seller", seller);
  }

  existBuyer() {
    return this.currentBuyer;
  }
  existSeller() {
    return this.currentSeller;
  }

  /*To add an item into cart*/
  addToCart(item: any) {
    this.cartItems.push(item);
  }

  /*To display all items in the cart */
  getAllCart() {

    return [].concat(this.cartItems);
  }
  /*To display list of bills */
  getAllBills(): any {
    return [].concat(this.allBills);
  }

  setBuyerAndBills(currentBuyer) {
    this.currentBuyer = currentBuyer;
    this.allBills = currentBuyer.allBills;
  }
  setSellerAndBills(currentSeller) {
    this.currentSeller = currentSeller;
    this.allBills = currentSeller.allBills;
  }

  getCurrentBuyer() {
    localStorage.setItem('token', JSON.stringify(this.validateBuyer));
    return this.currentBuyer;
  }


  /*To delete an item from cart */
  deleteCartItem(itemNo: number) {
    let size = this.cartItems.length;
    for (let i = 0; i < size; i++) {
      if (this.cartItems[i].itemId == itemNo) {
        this.cartItems.splice(i, 1);
        break;
      }
    }
    return [].concat(this.cartItems);
  }

  /*To add bill into bill list */
  addBill(todayDate: Date, total: number) {
    let allBillDetails: any[] = [];
    for (let i = 0; i < this.cartItems.length; i++) {
      allBillDetails.push({
        billDetailsId: 0,
        bill: null,
        item: this.cartItems[i]
      });
    }
    let bill: any = {
      billId: 0,
      billType: 'credit',
      billDate: todayDate,
      billRemarks: 'paid',
      billAmount: total,
      buyer: {
        buyerId: this.currentBuyer.buyerId
      },
      allBillDetails: allBillDetails
    }
    //this.allBills.push(bill);
    this.cartItems = [];
    allBillDetails = [];
    return this.Http.post("http://localhost:8083/BuyerItemService/emart/bill", bill);
  }

  /*To get buyer details */
  getBuyer() {
    return this.Http.get("http://localhost:8083/LoginService/emart/buyer/" + this.currentBuyer.buyerId);
  }
  getAllSItems() {

    return this.Http.get("http://localhost:8083/LoginService/emart/selleritems/" + this.currentSeller?.sellerId);
  }

  /*To check valid buyer */
  validateBuyer(user: string, password: string) {
    let crendential = user + ':' + password;
    let headers = new HttpHeaders();
    headers = headers.set('Authorization', crendential);

    return this.Http.get("http://localhost:8083/LoginService/emart/validate", { headers });
  }
  validateSeller(user: string, password: string) {
    let crendential = user + ':' + password;
    let headers = new HttpHeaders();
    headers = headers.set('Authorization', crendential);
    return this.Http.get("http://localhost:8083/LoginService/emart/sellervalidate", { headers });
  }
}

