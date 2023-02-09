<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\EncuestaRepository;
use App\Repository\PreguntaRepository;
use App\Repository\RespuestaRepository;
use App\Repository\ResultadoRepository;
use App\Entity\Encuesta;
use App\Entity\Resultado;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Validator\Constraints\Choice;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Knp\Component\Pager\PaginatorInterface;

class EncuestasController extends AbstractController
{
    /**
     * @Route("/home", name="app_encuestas")
     */
    public function index(EncuestaRepository $encuestaRepository): Response
    {
          $encuestas = $encuestaRepository->findAll();

        return $this->render('encuestas/index.html.twig', [
            'controller_name' => 'EncuestasController',
            'encuestas' => $encuestas

        ]);
    }

    /**
     * @Route("private/listarencuestas", name="linkEncuestas")
     */
    public function listarEncuestas(EncuestaRepository $encuestaRepository){

         $encuestas = $encuestaRepository->findAll();
         return $this->render("encuestas/listarEncuestas.html.twig", ['encuestas' => $encuestas]);
    }

    
    /**
     * @Route("listarPreguntas/{id}", defaults={"id"=null} ,name="linkPreguntas")
     * 
     */
     public function listarPreguntas(Request $request, RespuestaRepository $respuestaRepository ,PreguntaRepository $preguntaRepository, Encuesta $encuesta, ResultadoRepository $resultadoRepository){




        //Recibimos por parametro el id de la encuesta que ha sido seleccionada, pasamos como parametro el objeto encuesta que ha sido seleccionado y realizamos dos inyecciones de dependencias para poder acceder a repositorios externos
        //Recogemos la id de la encuesta clicada y lo guardamos en una variable, despues, invocamos al repositorio y le decimos que findBy por el criterio que le vamos a mandar, en este caso: las preguntas que tengan en el campo Encuesta el id de la encuesta recibida
        $IDrecibido = $encuesta->getId();

        $preguntasAListar = $preguntaRepository->findBy(["encuesta" => $IDrecibido]);
        //var_dump(serialize($preguntasAListar));
       //Recogemos IDs para iniciar una nueva busqueda
        
        foreach ($preguntasAListar as $p) {
            $IDS_Preguntas[] = $p->getId();
        }

        //Con los ids recogidos, lanzamos la nueva busqueda para localizar las respuestas a las preguntas.
         foreach ($preguntasAListar as $p) {
          $respuestasAListar = $respuestaRepository->findBy(["pregunta" => $IDS_Preguntas]);
         }
       
        

          foreach ($preguntasAListar as $pregunta) {
            
             foreach ($respuestasAListar as $respuesta ) {

                if($pregunta->getId() == $respuesta->getPregunta()->getId()){
                   
                    $options[$pregunta->getId()][$respuesta->getNombreRespuesta()] = $respuesta->getId();
                  
                 }

             }

           }
       
           $formBuilder = $this->createFormBuilder();

           foreach ($preguntasAListar as $item) {
           
            //var_dump($options[$item->getId()]);
            $formBuilder->add('Preguntas'. $item->getId(), ChoiceType::class, [
                    'label' => $item->getNombrePregunta(),
                    'required' => true,
                    'multiple' => false,
                    'expanded' => true,
                    'choices' => $options[$item->getId()],
                    
                ]);
                
           }

           $formBuilder->add('Aceptar', SubmitType::class);

           $form = $formBuilder->getForm();

           $form->handleRequest($request);

           if($form->isSubmitted() && $form->isValid()){
            
                $data = $form->getData();

                if ($form->getClickedButton() && 'Aceptar' === $form->getClickedButton()->getName()) {
                $i = 0;
                    foreach ($preguntasAListar as $item) {
                    

                        if(isset($data['Preguntas' . $item->getId()])){
            
                              $resultado = new Resultado();
                              $resultado->setPregunta($item);
                        
                              $respuestaId = $respuestaRepository->findBy(["id" => $data["Preguntas" . $item->getId()]]);
                              $resultado->setRespuesta($respuestaId[0]);
                              $fecha = new \DateTime('today');
                              $hora = new \DateTime('now');
                              $resultado->setFecha($fecha);
                              $resultado->setHora($hora);
                              $token = $this->container->get('security.token_storage')->getToken();
                              $resultado->setUsuario($token->getUser());
                              $resultadoRepository->save($resultado, true);
                        
                              

                        $i++;
                        }

                    }
                    
                    return $this->render('encuestas/index.html.twig', [
                        'controller_name' => 'EncuestasController',
                    ]);


                }

           }

        return $this->render("encuestas/listarPreguntas.html.twig", array('form' => $form->createView()));

     }



    /**
     * @Route("/pedircita", name="linkPedirCita")
     */
    public function pedirCita(){

    }

    /**
     * @Route("/nuestroEquipo", name="app_paginator_medicos")
     */
    public function nuestroEquipo(Request $request, PaginatorInterface $paginator ){

        
        // Recuperar el administrador de entidades de Doctrine
        $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery('SELECT p , e FROM App:Medico p inner join p.especialidad e ');

        // Paginar los resultados de la consulta
        $pagination = $paginator->paginate( 
            // Consulta Doctrine, no resultados
            $query,
            // Definir el parámetro de la página
            $request->query->getInt('page', 1),
            // Items per page
            5
        );
       
        // Renderizar la vista de twig
        return $this->render('paginator/listado.html.twig', ['pagination' => $pagination ]);
    }

  

    /**
     * @Route("/resultadoEncuestas", name="app_resultado_encuestas")
     */
    public function resultadoEncuestas(ResultadoRepository $resultadoRepository, RespuestaRepository $respuestaRepository, PreguntaRepository $preguntaRepository){


        $preguntas = $preguntaRepository->findAll();
        $resultados1 = $resultadoRepository->findBy(['pregunta' => 1 ,'respuesta' => 1]);
        $resultados2 = $resultadoRepository->findBy(['pregunta' => 1 ,'respuesta' => 2]);
        $resultados3 = $resultadoRepository->findBy(['pregunta' => 1 ,'respuesta' => 3]);
       
       
        print_r(count($resultados));
         echo "<br>";
        var_dump($resultados);

       


        $hola = "hola";
        return $this->render('encuestas/porcentajeEncuestas.html.twig', ['hola' => $hola ]);
    }




}
