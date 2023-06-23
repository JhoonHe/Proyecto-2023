import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ClientService } from 'src/app/services/client.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {
  form: FormGroup;
  spinner: boolean = false;
  formulario: boolean = true;

  mensaje: string;

  constructor(private fb: FormBuilder, private client: ClientService, private router: Router) {

  }

  ngOnInit(): void {
    this.form = this.fb.group({
      email: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  onSubmit() {
    if (this.form.valid) {
      this.spinner = true;
      this.formulario = false
      this.client.postRequest('http://localhost:10101/login',
        {
          email: this.form.value.email,
          password: this.form.value.password
        }, undefined, undefined).subscribe(
          (response: any) => {
            // console.log(response);

            // this.mensaje = response.Status;
            // console.log(this.mensaje);
            // this.router.navigate(['']);

            let id: number;

            id = response.id;

            setTimeout(() => {
              this.router.navigate(['/detalle-usuario', id]);
            }, 3000)

            // console.log("aaa" + id);

          },
          (error: any) => {

            setTimeout(() => {
              this.formulario = true;
              this.spinner = false;
              this.mensaje = error.error.Status;
              console.log(this.mensaje);
            }, 5000)
          }
        );
    } else {
      // console.log('Verifique sus datos');
      this.mensaje = "Verifique sus datos";
    }
  }

  obtenerEmail() {
    console.log(this.form.value.email);

  }

}
