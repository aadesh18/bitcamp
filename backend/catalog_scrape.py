import requests
from bs4 import BeautifulSoup
import re

s = """• AASP - African American Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/aasp/)
• AAST - Asian American Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/aast/)
• AGNR - Agriculture and Natural Resources (https://
academiccatalog.umd.edu/undergraduate/approved-courses/agnr/)
• AGST - Agricultural Science and Technology (https://
academiccatalog.umd.edu/undergraduate/approved-courses/agst/)
• AMSC - Applied Mathematics & Scientific Computation (https://
academiccatalog.umd.edu/undergraduate/approved-courses/amsc/)
• AMST - American Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/amst/)
• ANSC - Animal Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/ansc/)
• ANTH - Anthropology (https://academiccatalog.umd.edu/
undergraduate/approved-courses/anth/)
• AOSC - Atmospheric and Oceanic Science (https://
academiccatalog.umd.edu/undergraduate/approved-courses/aosc/)
• ARAB - Arabic (https://academiccatalog.umd.edu/undergraduate/
approved-courses/arab/)
• ARCH - Architecture (https://academiccatalog.umd.edu/
undergraduate/approved-courses/arch/)
• AREC - Agricultural and Resource Economics (https://
academiccatalog.umd.edu/undergraduate/approved-courses/arec/)
• ARHU - Arts and Humanities (https://academiccatalog.umd.edu/
undergraduate/approved-courses/arhu/)
• ARHX - Art History & Archaeology Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/arhx/)
• ARMY - Army (https://academiccatalog.umd.edu/undergraduate/
approved-courses/army/)
• ARSC - Air Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/arsc/)
• ARTH - Art History & Archaeology (https://academiccatalog.umd.edu/
undergraduate/approved-courses/arth/)
• ARTT - Art Studio (https://academiccatalog.umd.edu/undergraduate/
approved-courses/artt/)
• ARTX - Art Studio Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/artx/)
• ASTR - Astronomy (https://academiccatalog.umd.edu/
undergraduate/approved-courses/astr/)
• BCHM - Biochemistry (https://academiccatalog.umd.edu/
undergraduate/approved-courses/bchm/)
• BIOE - Bioengineering (https://academiccatalog.umd.edu/
undergraduate/approved-courses/bioe/)
• BIOM - Biometrics (https://academiccatalog.umd.edu/
undergraduate/approved-courses/biom/)
• BMGT - Business and Management (https://
academiccatalog.umd.edu/undergraduate/approved-courses/bmgt/)
• BSCI - Biological Sciences Program (https://
academiccatalog.umd.edu/undergraduate/approved-courses/bsci/)
• BSCV - CIVICUS (https://academiccatalog.umd.edu/undergraduate/
approved-courses/bscv/)
• BSGC - Global Communities (https://academiccatalog.umd.edu/
undergraduate/approved-courses/bsgc/)
• BSOS - Behavioral and Social Sciences (https://
academiccatalog.umd.edu/undergraduate/approved-courses/bsos/)
• BSST - Terrorism Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/bsst/)
• CCJS - Criminology and Criminal Justice (https://
academiccatalog.umd.edu/undergraduate/approved-courses/ccjs/)
• CHBE - Chemical and Biomolecular Engineering (https://
academiccatalog.umd.edu/undergraduate/approved-courses/chbe/)
• CHEM - Chemistry (https://academiccatalog.umd.edu/
undergraduate/approved-courses/chem/)
• CHIN - Chinese (https://academiccatalog.umd.edu/undergraduate/
approved-courses/chin/)
• CHSE - Counseling, Higher Education, and Special Education (https://
academiccatalog.umd.edu/undergraduate/approved-courses/chse/)
• CINE - Cinema and Media Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cine/)
• CINX - Cinema and Media Studies Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cinx/)
• CLAS - Classics (https://academiccatalog.umd.edu/undergraduate/
approved-courses/clas/)
• CMLT - Comparative Literature (https://academiccatalog.umd.edu/
undergraduate/approved-courses/cmlt/)
• CMLX - Comparative Literature Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cmlx/)
• CMSC - Computer Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/cmsc/)
• COMM - Communication (https://academiccatalog.umd.edu/
undergraduate/approved-courses/comm/)
• COMX - Communication Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/comx/)
• CPBE - College Park Scholars-Business, Society, and Economy
(https://academiccatalog.umd.edu/undergraduate/approved-courses/cpbe/)
• CPET - College Park Scholars-Environment, Technology & Economy
(https://academiccatalog.umd.edu/undergraduate/approved-courses/cpet/)
• CPGH - College Park Scholars-Global Public Health (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpgh/)
• CPJT - College Park Scholars-Justice and Legal Thought (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpjt/)
• CPMS - College Park Scholars-Media, Self and Society (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpms/)
• CPPL - College Park Scholars-Public Leadership (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cppl/)
• CPSA - College Park Scholars-Arts (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpsa/)
• CPSD - College Park Scholars-Science, Discovery & the Universe
(https://academiccatalog.umd.edu/undergraduate/approved-courses/cpsd/)
• CPSF - College Park Scholars-Life Sciences (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpsf/)
• CPSG - College Park Scholars-Science and Global Change (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpsg/)
• CPSN - College Park Scholars-International Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpsn/)
• CPSP - College Park Scholars Program (https://
academiccatalog.umd.edu/undergraduate/approved-courses/cpsp/)
• CPSS - College Park Scholars-Science, Technology and Society
(https://academiccatalog.umd.edu/undergraduate/approved-courses/cpss/)
• DANC - Dance (https://academiccatalog.umd.edu/undergraduate/
approved-courses/danc/)
• EALL - East Asian Languages and Literatures (https://
academiccatalog.umd.edu/undergraduate/approved-courses/eall/)
• ECON - Economics (https://academiccatalog.umd.edu/
undergraduate/approved-courses/econ/)
• EDCI - Curriculum and Instruction (https://academiccatalog.umd.edu/
undergraduate/approved-courses/edci/)
• EDCP - Education Counseling and Personnel Services (https://
academiccatalog.umd.edu/undergraduate/approved-courses/edcp/)
• EDHD - Education, Human Development (https://
academiccatalog.umd.edu/undergraduate/approved-courses/edhd/)
• EDHI - Education Leadership, Higher Ed and International Ed (https://
academiccatalog.umd.edu/undergraduate/approved-courses/edhi/)
• EDMS - Measurement, Statistics, and Evaluation (https://
academiccatalog.umd.edu/undergraduate/approved-courses/edms/)
• EDPS - Education Policy Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/edps/)
• EDSP - Education, Special (https://academiccatalog.umd.edu/
undergraduate/approved-courses/edsp/)
• EDUC - Education (https://academiccatalog.umd.edu/undergraduate/
approved-courses/educ/)
• ENAE - Engineering, Aerospace (https://academiccatalog.umd.edu/
undergraduate/approved-courses/enae/)
• ENBC - Biocomputational Engineering (https://
academiccatalog.umd.edu/undergraduate/approved-courses/enbc/)
• ENCE - Engineering, Civil (https://academiccatalog.umd.edu/
undergraduate/approved-courses/ence/)
• ENEB - Embedded Systems & Internet of Things (https://
academiccatalog.umd.edu/undergraduate/approved-courses/eneb/)
• ENEE - Electrical & Computer Engineering (https://
academiccatalog.umd.edu/undergraduate/approved-courses/enee/)
• ENES - Engineering Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/enes/)
• ENFP - Engineering, Fire Protection (https://
academiccatalog.umd.edu/undergraduate/approved-courses/enfp/)
• ENGL - English (https://academiccatalog.umd.edu/undergraduate/
approved-courses/engl/)
• ENGX - English Education Abroad (https://academiccatalog.umd.edu/
undergraduate/approved-courses/engx/)
• ENMA - Engineering, Materials (https://academiccatalog.umd.edu/
undergraduate/approved-courses/enma/)
• ENME - Engineering, Mechanical (https://academiccatalog.umd.edu/
undergraduate/approved-courses/enme/)
• ENNU - Engineering, Nuclear (https://academiccatalog.umd.edu/
undergraduate/approved-courses/ennu/)
• ENRE - Reliability Engineering (https://academiccatalog.umd.edu/
undergraduate/approved-courses/enre/)
• ENSP - Environmental Science and Policy (https://
academiccatalog.umd.edu/undergraduate/approved-courses/ensp/)
• ENST - Environmental Science and Technology (https://
academiccatalog.umd.edu/undergraduate/approved-courses/enst/)
• EPIB - Epidemiology and Biostatistics (https://
academiccatalog.umd.edu/undergraduate/approved-courses/epib/)
• FGSM - Federal and Global Fellows (https://
academiccatalog.umd.edu/undergraduate/approved-courses/fgsm/)
• FIRE - First-Year Innovation & Research Experience (https://
academiccatalog.umd.edu/undergraduate/approved-courses/fire/)
• FMSC - Family Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/fmsc/)
• FOLA - Foreign Language (https://academiccatalog.umd.edu/
undergraduate/approved-courses/fola/)
• FREN - French (https://academiccatalog.umd.edu/undergraduate/
approved-courses/fren/)
• GEMS - Gemstone (https://academiccatalog.umd.edu/
undergraduate/approved-courses/gems/)
• GEOG - Geographical Sciences (https://academiccatalog.umd.edu/
undergraduate/approved-courses/geog/)
• GEOL - Geology (https://academiccatalog.umd.edu/undergraduate/
approved-courses/geol/)
• GERM - Germanic Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/germ/)
• GERS - German Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/gers/)
• GREK - Greek (https://academiccatalog.umd.edu/undergraduate/
approved-courses/grek/)
• GVPT - Government and Politics (https://academiccatalog.umd.edu/
undergraduate/approved-courses/gvpt/)
• HACS - ACES-Cybersecurity (https://academiccatalog.umd.edu/
undergraduate/approved-courses/hacs/)
• HDCC - Design Cultures and Creativity (https://
academiccatalog.umd.edu/undergraduate/approved-courses/hdcc/)
• HEBR - Hebrew (https://academiccatalog.umd.edu/undergraduate/
approved-courses/hebr/)
• HEIP - Entrepreneurship and Innovation (https://
academiccatalog.umd.edu/undergraduate/approved-courses/heip/)
• HESI - Higher Ed, Student Affairs, and International Ed Policy (https://
academiccatalog.umd.edu/undergraduate/approved-courses/hesi/)
• HESP - Hearing and Speech Sciences (https://
academiccatalog.umd.edu/undergraduate/approved-courses/hesp/)
• HGLO - Honors Global Communities (https://
academiccatalog.umd.edu/undergraduate/approved-courses/hglo/)
• HHUM - Honors Humanities (https://academiccatalog.umd.edu/
undergraduate/approved-courses/hhum/)
• HISP - Historic Preservation (https://academiccatalog.umd.edu/
undergraduate/approved-courses/hisp/)
• HIST - History (https://academiccatalog.umd.edu/undergraduate/
approved-courses/hist/)
• HISX - History Education Abroad (https://academiccatalog.umd.edu/
undergraduate/approved-courses/hisx/)
• HLSA - Health Services Administration (https://
academiccatalog.umd.edu/undergraduate/approved-courses/hlsa/)
• HLSC - Integrated Life Sciences (https://academiccatalog.umd.edu/
undergraduate/approved-courses/hlsc/)
• HLTH - Health (https://academiccatalog.umd.edu/undergraduate/
approved-courses/hlth/)
• HNUH - University Honors (https://academiccatalog.umd.edu/
undergraduate/approved-courses/hnuh/)
• HONR - Honors (https://academiccatalog.umd.edu/undergraduate/
approved-courses/honr/)
• IDEA - Academy for Innovation & Entrepreneurship (https://
academiccatalog.umd.edu/undergraduate/approved-courses/idea/)
• IMDM - Immersive Media Design (https://academiccatalog.umd.edu/
undergraduate/approved-courses/imdm/)
• IMMR - Immigration Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/immr/)
• INAG - Institute of Applied Agriculture (https://
academiccatalog.umd.edu/undergraduate/approved-courses/inag/)
• INST - Information Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/inst/)
• ISRL - Israel Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/isrl/)
• ITAL - Italian (https://academiccatalog.umd.edu/undergraduate/
approved-courses/ital/)
• ITAX - Italian Education Abroad (https://academiccatalog.umd.edu/
undergraduate/approved-courses/itax/)
• IVSP - Individual Studies Program (https://
academiccatalog.umd.edu/undergraduate/approved-courses/ivsp/)
• JAPN - Japanese (https://academiccatalog.umd.edu/undergraduate/
approved-courses/japn/)
• JOUR - Journalism (https://academiccatalog.umd.edu/
undergraduate/approved-courses/jour/)
• JWST - Jewish Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/jwst/)
• KNES - Kinesiology (https://academiccatalog.umd.edu/
undergraduate/approved-courses/knes/)
• KORA - Korean (https://academiccatalog.umd.edu/undergraduate/
approved-courses/kora/)
• LACS - Latin American and Caribbean Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/lacs/)
• LARC - Landscape Architecture (https://academiccatalog.umd.edu/
undergraduate/approved-courses/larc/)
• LASC - Certificate in Latin American Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/lasc/)
• LASX - Certificate in Latin American Studies Education Abroad
(https://academiccatalog.umd.edu/undergraduate/approved-courses/lasx/)
• LATN - Latin (https://academiccatalog.umd.edu/undergraduate/
approved-courses/latn/)
• LBSC - Library Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/lbsc/)
• LGBT - Lesbian Gay Bisexual Transgender Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/lgbt/)
• LGBX - Lesbian Gay Bisexual Transgender Studies Education Abroad
(https://academiccatalog.umd.edu/undergraduate/approved-courses/lgbx/)
• LING - Linguistics (https://academiccatalog.umd.edu/undergraduate/
approved-courses/ling/)
• MATH - Mathematics (https://academiccatalog.umd.edu/
undergraduate/approved-courses/math/)
• MEES - Marine-Estuarine-Environmental Sciences (https://
academiccatalog.umd.edu/undergraduate/approved-courses/mees/)
• MIEH - Maryland Institute for Applied Environmental Health (https://
academiccatalog.umd.edu/undergraduate/approved-courses/mieh/)
• MITH - Maryland Institute for Technology in the Humanities (https://
academiccatalog.umd.edu/undergraduate/approved-courses/mith/)
• MLAW - MPower Undergraduate Law Programs (https://
academiccatalog.umd.edu/undergraduate/approved-courses/mlaw/)
• MLSC - MD Language Science Ctr (https://
academiccatalog.umd.edu/undergraduate/approved-courses/mlsc/)
• MUED - Music Education (https://academiccatalog.umd.edu/
undergraduate/approved-courses/mued/)
• MUET - Ethnomusicology (https://academiccatalog.umd.edu/
undergraduate/approved-courses/muet/)
• MUSC - School of Music (https://academiccatalog.umd.edu/
undergraduate/approved-courses/musc/)
• MUSP - Music Performance (https://academiccatalog.umd.edu/
undergraduate/approved-courses/musp/)
• NAVY - Navy (https://academiccatalog.umd.edu/undergraduate/
approved-courses/navy/)
• NEUR - Neuroscience (https://academiccatalog.umd.edu/
undergraduate/approved-courses/neur/)
• NFSC - Nutrition and Food Science (https://
academiccatalog.umd.edu/undergraduate/approved-courses/nfsc/)
• PEER - Health Center (https://academiccatalog.umd.edu/
undergraduate/approved-courses/peer/)
• PERS - Persian (https://academiccatalog.umd.edu/undergraduate/
approved-courses/pers/)
• PHIL - Philosophy (https://academiccatalog.umd.edu/undergraduate/
approved-courses/phil/)
• PHIX - Philosophy Education Abroad (https://academiccatalog.umd.edu/undergraduate/approved-courses/phix/)
• PHPE - Philosophy, Politics, and Economics (https://
academiccatalog.umd.edu/undergraduate/approved-courses/phpe/)
• PHPX - Philosophy, Politics, and Economics Education Abroad
(https://academiccatalog.umd.edu/undergraduate/approved-courses/phpx/)
• PHSC - Public Health Science (https://academiccatalog.umd.edu/
undergraduate/approved-courses/phsc/)
• PHYS - Physics (https://academiccatalog.umd.edu/undergraduate/
approved-courses/phys/)
• PLCY - Public Policy (https://academiccatalog.umd.edu/
undergraduate/approved-courses/plcy/)
• PLSC - Plant Sciences (https://academiccatalog.umd.edu/
undergraduate/approved-courses/plsc/)
• PORT - Portuguese (https://academiccatalog.umd.edu/
undergraduate/approved-courses/port/)
• PSYC - Psychology (https://academiccatalog.umd.edu/
undergraduate/approved-courses/psyc/)
• RDEV - Real Estate Development (https://academiccatalog.umd.edu/
undergraduate/approved-courses/rdev/)
• RELS - Religious Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/rels/)
• RUSS - Russian (https://academiccatalog.umd.edu/undergraduate/
approved-courses/russ/)
• SLAA - Second Language Acquisition and Application (https://
academiccatalog.umd.edu/undergraduate/approved-courses/slaa/)
• SLLC - School of Languages, Literatures and Cultures (https://
academiccatalog.umd.edu/undergraduate/approved-courses/sllc/)
• SLLX - School of Languages, Literatures & Cultures Education Abroad
(https://academiccatalog.umd.edu/undergraduate/approved-courses/sllx/)
• SMLP - Southern Management Leadership Program (https://
academiccatalog.umd.edu/undergraduate/approved-courses/smlp/)
• SOCY - Sociology (https://academiccatalog.umd.edu/undergraduate/
approved-courses/socy/)
• SPAN - Spanish (https://academiccatalog.umd.edu/undergraduate/
approved-courses/span/)
• SPAX - Spanish Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/spax/)
• SPHL - Public Health (https://academiccatalog.umd.edu/
undergraduate/approved-courses/sphl/)
• STAT - Statistics and Probability (https://academiccatalog.umd.edu/
undergraduate/approved-courses/stat/)
• SURV - Survey Methodology (https://academiccatalog.umd.edu/
undergraduate/approved-courses/surv/)
• TDPS - Theatre, Dance and Performance Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/tdps/)
• THET - Theatre (https://academiccatalog.umd.edu/undergraduate/
approved-courses/thet/)
• THEX - Theatre Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/thex/)
• TLPL - Teaching and Learning, Policy and Leadership (https://
academiccatalog.umd.edu/undergraduate/approved-courses/tlpl/)
• TLTC - Teaching and Learning Transformation Center (https://
academiccatalog.umd.edu/undergraduate/approved-courses/tltc/)
• UMEI - Maryland English Institute (https://
academiccatalog.umd.edu/undergraduate/approved-courses/umei/)
• UNIV - University Courses (https://academiccatalog.umd.edu/
undergraduate/approved-courses/univ/)
• URSP - Urban Studies and Planning (https://
academiccatalog.umd.edu/undergraduate/approved-courses/ursp/)
• USLT - Latina/o Studies (https://academiccatalog.umd.edu/
undergraduate/approved-courses/uslt/)
• WGSS - Women, Gender, and Sexuality Studies (https://
academiccatalog.umd.edu/undergraduate/approved-courses/wgss/)
• WMSX - Women's Studies Education Abroad (https://
academiccatalog.umd.edu/undergraduate/approved-courses/wmsx/)"""

matches = re.findall(r"\(([^)]+)\)", s)
for i in range(len(matches)):
    matches[i] = matches[i].replace("\n", "")

count = 0
courses = []

name = []

for url in matches:
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")

    

    main_frame = soup.body
    frame_a = main_frame.find(id="content-wrapper", class_ = "wrap clearfix")

    frame_b = frame_a.find(id="right-col")
    frame_c = frame_b.find(id="content", attrs={'role': 'main'})
    frame_d = frame_c.find(id="textcontainer", class_ = "page_content")
    frame_e = frame_d.find(class_="sc_sccoursedescs")
    course_blocks = frame_e.find_all("div", class_ = "courseblock")
    
    for block in course_blocks:
        # courses.append({"id":count, 
        # "name": block.find(class_="courseblocktitle noindent").text, 
        # "description": block.find(class_="courseblockdesc noindent").text.replace("\t", "")})
        # count += 1

        name.append(block.find(class_="courseblockdesc noindent").text.replace("\t", ""))

print(name)


    

