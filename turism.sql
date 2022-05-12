-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 12, 2022 at 09:31 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turism`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nume_artist` varchar(180) NOT NULL,
  `studii` varchar(180) NOT NULL,
  `varsta` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `nume_artist`, `studii`, `varsta`) VALUES
(1, 'Theodor Pallady', 'Politehnica din Dresda, Școala Națională Superioară de Arte Frumoase de la Paris, Academia de Arte Frumoase din München.', 85),
(2, 'Liliana Chiriac', 'Liceul de artă, Chişinău, Academia de Artă Bucureşti, Facultatea de Arte Decorative şi Design', 51),
(3, 'Artista Athena Dumitriu', 'Scoala de Arte', 40),
(4, 'Anonim', 'Necunoscut', 0),
(5, 'Postaru Viorica', 'Facultatea de Chimie', 54),
(6, 'Popa Valentin', 'Liceul de Arte', 44);

-- --------------------------------------------------------

--
-- Table structure for table `expozitie`
--

DROP TABLE IF EXISTS `expozitie`;
CREATE TABLE IF NOT EXISTS `expozitie` (
  `id_expozitie` int NOT NULL AUTO_INCREMENT,
  `nume_expozitie` varchar(180) NOT NULL,
  `descriere` varchar(800) NOT NULL,
  PRIMARY KEY (`id_expozitie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `expozitie`
--

INSERT INTO `expozitie` (`id_expozitie`, `nume_expozitie`, `descriere`) VALUES
(1, 'Din opera grafica a lui Theodor Pallady', 'Expozitia urmareste o structurare cronologica, astfel dintre lucrarile timpurii ale artistului sunt prezente cateva compozitii alegorice din perioada 1896-1900 si o suita de impresii din Moldova din perioada 1906-1916, care sunt urmate de peisajele din Franta, in special din „Parisul sau”, dar si din Dobrogea sau Bucuresti, unde a revenit anual cu participari la expozitii.'),
(2, 'Expozitia Camasa Ciumei', 'Artista Athena Dumitriu realizeaza o Camasa a Ciumei din canepa, pornind de la acest obicei stravechi de vindecare pe care il reinterpreteaza intr-o cheie contemporana si adaptata vremurilor actuale.'),
(3, 'Muzeul Pandemiei. Identitati fragile. Valul 2', 'Muzeul Pandemiei propune anul acesta un nou proiect participativ axat pe ilustrarea violenței domestice (re)simțită individual de către femeile din România în contextul pandemic.'),
(4, 'Minunea Mea', 'Minunea mea este un indemn la sondare dupa cele mai valoroase resurse energetice la care putem apela cand avem nevoie de o doza de miraj in rutina zilnica. Suntem mai bogati cu minunile noastre si pentru ca, asa cum ne spun cercetatorii, creierul nostru transmite semnale benefice intregului corp chiar daca doar ne conectam la imaginea mentala care ne-a facut sa ne minunam odata.');

-- --------------------------------------------------------

--
-- Table structure for table `galerie`
--

DROP TABLE IF EXISTS `galerie`;
CREATE TABLE IF NOT EXISTS `galerie` (
  `id_galerie` int NOT NULL AUTO_INCREMENT,
  `nume_galerie` varchar(180) NOT NULL,
  `tema` varchar(180) NOT NULL,
  `muzeu` int NOT NULL,
  PRIMARY KEY (`id_galerie`),
  KEY `galerie_ibfk_1` (`muzeu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `galerie`
--

INSERT INTO `galerie` (`id_galerie`, `nume_galerie`, `tema`, `muzeu`) VALUES
(1, 'A', 'Arta', 7),
(2, 'Sala Acvariu', 'Cultura & traditie', 9),
(3, 'Galeria pandemiei', 'Violenta domestica', 10),
(4, 'Galeria pictorilor de azi', 'Picturi', 7);

-- --------------------------------------------------------

--
-- Table structure for table `galerie_expozitie`
--

DROP TABLE IF EXISTS `galerie_expozitie`;
CREATE TABLE IF NOT EXISTS `galerie_expozitie` (
  `expozitie` int NOT NULL,
  `galerie` int NOT NULL,
  KEY `galerie` (`galerie`),
  KEY `expozitie` (`expozitie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `galerie_expozitie`
--

INSERT INTO `galerie_expozitie` (`expozitie`, `galerie`) VALUES
(1, 1),
(2, 2),
(4, 4),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `muzeu`
--

DROP TABLE IF EXISTS `muzeu`;
CREATE TABLE IF NOT EXISTS `muzeu` (
  `id_muzeu` int NOT NULL AUTO_INCREMENT,
  `nume_muzeu` varchar(130) NOT NULL,
  `oras` varchar(130) NOT NULL,
  `adresa` varchar(230) NOT NULL,
  `descriere` varchar(800) NOT NULL,
  PRIMARY KEY (`id_muzeu`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `muzeu`
--

INSERT INTO `muzeu` (`id_muzeu`, `nume_muzeu`, `oras`, `adresa`, `descriere`) VALUES
(1, 'Muzeul Ion Luca Caragiale', 'Ploiesti', 'Strada Kutuzov 1, 100022', 'Muzeul a luat fiinta din pasiunea pentru istorie si cultura a distinsului prof. N. Simache, in anul 1962, cand s-au sarbatorit 110 ani de la nasterea marelui clasic al literaturii romane si a fost reorganizat in anul 2002, cu prilejul ANULUI CARAGIALE.'),
(2, 'Muzeul Omului', 'Ploiesti', 'Strada Sublocotenent Erou Calin Catalin 1, 100066', 'Materialul expozitional, de o mare diversitate, este prezentat intr-o maniera moderna si functionala, extrem de sugestiv, cu o incarcatura informationala complexa, dar bine dotata si accesibila, cu o desfasurare logica, pe coordonatele rigorii stiintifice si ale principiilor muzeistii moderne.'),
(3, 'Muzeul de Arta', 'Ploiesti', 'Bd.Independentei 1', 'Muzeul de Arta Ploiesti isi are originea in Pinacoteca Municipiului Ploiesti, infiintata in noiembrie 1931 in urma eforturilor consecvente ale unui grup de vaza de intelectuali ploiesteni, intre care avocatul, omul politic si colectionarul de arta Ion Ionescu-Quintus, arhitectul Toma T. Socolescu, istoricul Dumitru Munteanu-Ramnic, cu sprijinul autoritatilor locale si in cadrul Asezamintelor Culturale Nicolae Iorga.'),
(4, 'Muzeul National al Petrolului', 'Ploiesti', 'Str.Dr.Bagdasar 8\r\n', 'Pentru cei care trec pragul  muzeului,  inseamna posibilitatea cunoasterii celor mai importante momente ale istoriei petrolului si ale orasului - atat de impletite una cu cealalta -   si prilejul de a  cunoaste personalitatile marcante  ale activitatilor de descoperire, exploatare si prelucrare ale acestor importante zacaminte naturale. Specialistii din domeniu  prezentati in expozitia  muzeului  au fost recunoscuti pe plan mondial pentru inventiile si inovatiile lor si constituie adevarate modele pentru tinerii vizitatori.'),
(5, 'Casa Memorială George și Aghata Bacovia', 'Bucuresti', 'Strada George Bacovia 63	', 'Casa Memoriala George si Agatha Bacovia a fost infiintata in 1958 si face parte din patrimoniul cultural al Bucurestiului, fiind deschisa vizitatorilor din 1966. Imobilul este cea mai importanta marturie a vietii poetului George Bacovia, care a trait aici din 1933 pana in 1957, alaturi de sotia sa, Agatha. Spatiul simplu, reconstruieste prin fiecare coltisor atmosfera in care lucra poetul, dar si viata de zi cu zi a acestuia.\r\n\r\n'),
(6, 'Muzeul Bancii Nationale a Romaniei', 'Bucuresti', 'Strada Doamnei 8', 'E una dintre cele mai valoroase colecții numismatice din România acoperind o perioadă de peste două milenii și jumătate, fiind expuse printre altele și cea mai veche monedă bătută pe teritoriul României de astăzi, și cei mai mici bani din hârtie tipăriți în România.'),
(7, 'Muzeul Colectiilor de Arta', 'Bucuresti', 'Calea Victoriei 111	', 'Muzeul Colectiilor de Arta prezinta publicului lucrari reprezentative pentru fenomenul artistic si pentru colectionismul din Romania.'),
(8, 'Muzeul Judetean de Stiinte ale Naturii Prahova', 'Ploiesti', 'Strada Sublocotenent Erou Calin Catalin 1', 'Muzeul de Stiintele Naturii este un muzeu de tip special, pentru ca el stocheaza viul si neviul, avand ca scop instruirea si educarea publicului, atat pentru interes stiintific, dar si pentru a trezi dragostea si interesul fata de viata si natura.'),
(9, 'Muzeul National al Taranului Roman', 'Bucuresti', 'Soseaua Pavel D. Kiseleff 3', 'Colectiile de costume populare, ceramica si icoane prezinta cultura romana intr-o cladire impozanta, din 1941.'),
(10, 'ARCUB', 'Bucuresti', 'Strada Lipscani nr. 84', 'Centru cultural');

-- --------------------------------------------------------

--
-- Table structure for table `obiect`
--

DROP TABLE IF EXISTS `obiect`;
CREATE TABLE IF NOT EXISTS `obiect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nume_obiect` varchar(180) NOT NULL,
  `id_artist` int NOT NULL,
  `descriere` varchar(800) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `obiect_ibfk_1` (`id_artist`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `obiect`
--

INSERT INTO `obiect` (`id`, `nume_obiect`, `id_artist`, `descriere`) VALUES
(1, 'Flori galbene şi albastre', 2, 'Naturile statice au în opera lui Theodor Pallady rolul unor catalizatori simbolici sui generis. Fiecare obiect, concentrează o semnificaţie atemporală fiind în acelaşi timp expresia unui moment tranzitoriu din viaţa artistului.'),
(2, 'Flori la fereasta, Place Dauphine', 2, 'Compozitia ,,Flori la fereasta, Place Dauphine” este o capodopera, in ea artistul ilustreaza un colt din Piata Dauphine, care se vede prin fereastra deschisa, asfaltul este ud dupa ploaia care tocmai s-a oprit, cerul innorat, in dreptul ferestrei se afla ziarul deschis pe masa si un ghiveci cu flori. Imaginea din tablou este asociata cu spiritul artistului.'),
(3, 'Pont-Neuf', 2, 'In peisajul ,,Pont-Neuf” artistul recurge la o paleta restransa de culori, realizand o distributie a luminii, ce reda imaginea tarmurilor Senei, podul si cladirile din jur.'),
(4, 'Natura Moarta', 2, 'Compozitie cu pistol, farfurie si cana. Vazute de sus, pe o masa, cateva obiecte, diferite ca marime, forma si structura, toate paginate in plan central.'),
(5, 'Canasa Ciumei', 3, 'Lipsiti de informatii medicale si de alte mijloace de protectie, taranii credeau in magia vindecatoare a unui obiect vestimentar realizat din canepa, deoarece firele ei erau iubite de draci si de vrajitoare'),
(6, 'Bata de baseball', 4, 'Obiect folosit impotriva unei victime a violentei domestice in timpul restrictiilor pandemiei. Victima este protejata sub anonimat.'),
(7, 'Valuri de dor', 5, 'Picture in ulei realizata pe panza, valuri albastre'),
(8, 'Umbra de femeie', 5, 'ulei, acril panza'),
(9, 'Pofta acerba', 5, 'ulei, acril mix media pe panza de sac'),
(10, 'Adela', 6, 'acril carton panzat'),
(11, 'Octombrie la constanta', 6, 'acril carton panzat');

-- --------------------------------------------------------

--
-- Table structure for table `obiect_expozitie`
--

DROP TABLE IF EXISTS `obiect_expozitie`;
CREATE TABLE IF NOT EXISTS `obiect_expozitie` (
  `id_obiect` int NOT NULL,
  `id_expozitie` int NOT NULL,
  KEY `obiect_expozitie_ibfk_1` (`id_expozitie`),
  KEY `obiect_expozitie_ibfk_2` (`id_obiect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `obiect_expozitie`
--

INSERT INTO `obiect_expozitie` (`id_obiect`, `id_expozitie`) VALUES
(5, 2),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(6, 3),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `galerie`
--
ALTER TABLE `galerie`
  ADD CONSTRAINT `galerie_ibfk_1` FOREIGN KEY (`muzeu`) REFERENCES `muzeu` (`id_muzeu`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `galerie_expozitie`
--
ALTER TABLE `galerie_expozitie`
  ADD CONSTRAINT `galerie_expozitie_ibfk_1` FOREIGN KEY (`galerie`) REFERENCES `galerie` (`id_galerie`) ON DELETE CASCADE,
  ADD CONSTRAINT `galerie_expozitie_ibfk_2` FOREIGN KEY (`expozitie`) REFERENCES `expozitie` (`id_expozitie`) ON DELETE CASCADE;

--
-- Constraints for table `obiect`
--
ALTER TABLE `obiect`
  ADD CONSTRAINT `obiect_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `obiect_expozitie`
--
ALTER TABLE `obiect_expozitie`
  ADD CONSTRAINT `obiect_expozitie_ibfk_1` FOREIGN KEY (`id_expozitie`) REFERENCES `expozitie` (`id_expozitie`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `obiect_expozitie_ibfk_2` FOREIGN KEY (`id_obiect`) REFERENCES `obiect` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
