<?php

namespace App\Entity;

use App\Repository\EncuestaRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=EncuestaRepository::class)
 */
class Encuesta
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombreEncuesta;

    /**
     * @ORM\OneToMany(targetEntity=Pregunta::class, mappedBy="encuesta")
     */
    private $preguntas;

    public function __construct()
    {
        $this->preguntas = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombreEncuesta(): ?string
    {
        return $this->nombreEncuesta;
    }

    public function setNombreEncuesta(string $nombreEncuesta): self
    {
        $this->nombreEncuesta = $nombreEncuesta;

        return $this;
    }

    /**
     * @return Collection<int, Pregunta>
     */
    public function getPreguntas(): Collection
    {
        return $this->preguntas;
    }

    public function addPregunta(Pregunta $pregunta): self
    {
        if (!$this->preguntas->contains($pregunta)) {
            $this->preguntas[] = $pregunta;
            $pregunta->setEncuesta($this);
        }

        return $this;
    }

    public function removePregunta(Pregunta $pregunta): self
    {
        if ($this->preguntas->removeElement($pregunta)) {
            // set the owning side to null (unless already changed)
            if ($pregunta->getEncuesta() === $this) {
                $pregunta->setEncuesta(null);
            }
        }

        return $this;
    }
}
