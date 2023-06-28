import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ClientService } from 'src/app/services/client.service';
import { NgModule } from '@angular/core';
@Component(

  {

    selector: 'app-detalle-prenda',
    templateUrl: './detalle-prenda.component.html',
    styleUrls: ['./detalle-prenda.component.css'],

  }

)
export class DetallePrendaComponent implements OnInit {


  idPrenda: number;
  prenda: any;

  idCategoria: any;
  nombreCategoria: any;

  // valorIdPrenda: number;

  recomendadas: any;

  constructor(private routeActivate: ActivatedRoute, private client: ClientService) {

  }

  ngOnInit(): void {
    this.idPrenda = this.routeActivate.snapshot.params["id"];
    console.log("ID" + this.idPrenda);

    this.client.getRequest(`http://localhost:10101/detalle-prenda/${this.idPrenda}`).subscribe(
      ((response: any) => {
        // console.log(response);
        this.prenda = response.prendas;
        console.log("aaa" + response.prendas[0].idCategoria);
        console.log("aaa" + response.prendas[0].nombreCategoria);

        this.idCategoria = response.prendas[0].idCategoria;
        this.nombreCategoria = response.prendas[0].nombreCategoria;
        console.log(this.idCategoria);

        this.client.postRequest(`http://localhost:10101/pendas-recomendadas`,
          {
            idCategoria: this.idCategoria,
            nombreCategoria: this.nombreCategoria,
            idPrenda: this.idPrenda
          }
        ).subscribe(
          ((response: any) => {
            this.recomendadas = response.recomendadas;
            console.log(response);
          }),
          ((error: any) => {
            console.log(error.error.Status);
            console.log(error);
          })
        );

      }),
      ((error: any) => {
        console.log(error.error.Status);
        console.log(error);

      })
    );



  }

  comprar() {
    this.idPrenda = this.routeActivate.snapshot.params["id"];
    this.client.postRequest(`http://localhost:10101/detalle-prenda/${this.idPrenda}`).subscribe(
      ((response: any) => {
        console.log(response);

      }),
      ((error: any) => {
        console.log(error.error.Status);
        console.log(error);

      })
    );
  }

}

