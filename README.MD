# 1.PostgreSQL:
    PostgreSQL হচ্ছে শক্তিশালী, অত্যন্ত স্থিতিশীল অবজেক্ট রিলেশনাল ,জনপ্রিয় এবং বিশ্বস্ত ডেটাবেজ মাধ্যম যা ব্যবহৃত হয় বিশেষ ধরনের স্টার্টআপ গুলির ব্যাক এন্ড ডেভেলপমেন্ট এর জন্য | PostgreSQL সম্পর্কে সবচেয়ে সহজ জিনিস হল এটি ওপেন সোর্স, শক্তিশালী,উচ্চ কর্মক্ষমতা সম্পন্ন কাজটি বোঝার জন্য যথেষ্ট | এটি একটি শক্তিশালী সম্প্রদায়ের দ্বারা সমর্থিত। PostgreSQL তার প্রধান কোয়েরি ভাষা হিসেবে একটি SQL ব্যবহার করে |অন্য কথায়,PostgreSQL হল ডাটাবেসের জন্য একটি ইঞ্জিন |SQL হলো ডাটাবেসের সাথে ইন্টারঅ্যাক্ট করা |একটি PostgreSQL মোবাইল, অ্যাপ্লিকেশন জিও স্পেশাল এবং অ্যানালিস্টিক অ্যাপ্লিকেশনের মতো অনেক ওয়েবসাইটের ডেটা স্টোর বা ডেটা গুদামের জন্য ব্যবহৃত হয়।এটি ডেভেলপারদের তথ্যের স্বচ্ছতা নিশ্চিত করার জন্য  স্কেলেবল অ্যাপ্লিকেশন তৈরিতে সহায়তা করে|নতুন হোক বা পেশাদার, সকল ডেভেলপারই তথ্যের ধরন ও জটিলতা নির্বিশেষে তাদের ডেটা পরিচালনার জন্য PostgreSQL ব্যবহার করে।


# 3. PostgreSql এ primary key এবং foreign key এর ধারণা দেওয়া হলো:

  * Primary Key হচ্ছে একটি প্রধান শনাক্তকারী key. Primary Key তে অবশ্যই UNIQUE মান থাকতে হবে এবং NULL মান থাকতে পারবে না।একটি টেবিলে কেবল একটি Primary key থাকতে পারে এবং টেবিলে, এই Primary Key তে একক বা একাধিক কলাম থাকতে পারে।
Ex.
  Id    Name      Age

  1     Mahedi    20
  2     Mezba     32
  3     Mizanur   32

 উপরের টেবিলটিতে আইডি হচ্ছে Primary Key.Id number 2 বললে বোঝা যাবে এইটা মেজবা ভাইকে বলা হচ্ছে|কিন্তু Age 32 বললে বোঝা যাবে না এটা কাকে বলা হচ্ছে | 

* FOREIGN KEY হল একটি টেবিলের একটি ক্ষেত্র  যা অন্য টেবিলের PRIMARY KEY কে নির্দেশ করে। FOREIGN KEY সহ টেবিলটিকে চাইল্ড টেবিল বলা হয় |টেবিলের মধ্যে সংযোগ নষ্ট করে এমন ক্রিয়া প্রতিরোধ করার জন্য FOREIGN KEY সীমাবদ্ধতা ব্যবহার করা হয়।
Ex.
 Persons table
 PersonId    Name      Age
    1     Mahedi    20
    2     Mezba     32
    3     Mizanur   32

Order table
 OrderId     OrderNumber   PersonId 
   1          2234            2
   2          2335            2
   3          3345            3
   4          4566            1

"PersonId" টেবিলের "PersonId" কলামটি "Persons" টেবিলের Primary Key।
"Order" টেবিলের "PersonId" কলামটি "Order" টেবিলের একটি Foreign Key।

# 6.LIMIT এবং OFFSET ধারার ব্যবহার:

* LIMIT:আমি কয়টা ROW এর ডাটা সংগ্রহ করতে চাই বা দেখাতে চাই তার জন্য LIMIT ব্যবহার    করা হয় |
Ex.
personS 
 PersonId    Name     Age
    1     Mahedi      20
    2     Mezba       32
    3     Mizanur     32
    4     Mahid       20
    5     Mahmud      32
    6     Mahin       32

 SELECT *FROM persons LIMIT 3:
এভাবে LIMIT কুয়েরি ব্যবহারের মাধ্যমে প্রথম তিনটা ROW দেখতে পাবো |

 * OFFSET: মূলত ডেটাবেজ থেকে নির্দিষ্ট  পরিমাণের ডাটা স্কিপ বা বাদ দিয়ে নির্দিষ্ট পরিমাণ ডাটা দেখার OFFSET ব্যবহার করা হয় |
Ex.
personS 
 PersonId    Name     Age
    1     Mahedi      20
    2     Mezba       32
    3     Mizanur     32
    4     Mahid       20
    5     Mahmud      32
    6     Mahin       32
SELECT * FROM persons LIMIT 2 OFFSET 3;
এই কুয়েরি ব্যবহারের মাধ্যমে প্রথম তিনটি ডাটা বাদ দিয়ে পরবর্তী দুইটি ডাটা দেখা যাবে|


# 7. UPDATE:
UPDATE স্টেটমেন্টটি একটি টেবিলে বিদ্যমান রেকর্ডগুলি পরিবর্তন করতে ব্যবহৃত হয়।
Ex.
 persons
PersonId    Name      Age
    1      Mahedi     20
    2      Mezba      32
    3      Mizanur    32

UPDATE persons
SET Name = 'Mahin'
WHERE PersonId = 2;

এখানে WHERE ব্যবহার করার মাধ্যমে নির্দিষ্ট টেবিলের ডাটা পরিবর্তন করা সম্ভব হয়েছে|অন্যথায় পুরো টেবিলের ডাটা পরিবর্তন হয়ে যাবে|

# 10. PostgreSQL-এ COUNT(), SUM(), এবং AVG() এর মতো সমষ্টিগত ফাংশনগুলি গণনা:
 PostgreSQL-এ সমষ্টিগত ফাংশন ব্যবহার করে ডেটাবেজের একাধিক রেকর্ড থেকে সারাংশ তথ্য নির্ণয় করা যায়। 
 * COUNT()ফাংশন নির্দিষ্ট কলামে কতগুলো রেকর্ড আছে তা গণনা করতে ব্যবহার করা হয়|এটি সাধারণত সারির সংখ্যা নির্ণয়ে ব্যবহৃত হয়।

*  SUM() ফাংশন নির্দিষ্ট কলামের সমস্ত সংখ্যার যোগফল নির্ণয় ব্যবহার করা হয়|

*  AVG() ফাংশন নির্দিষ্ট সংখ্যাসংক্রান্ত কলামের গড় নির্ণয় ব্যবহার করা হয়|

Ex.
 persons
PersonId    Name      Age
    1      Mahedi     20
    2      Mezba      32
    3      Mizanur    32

* SELECT COUNT(Name) FROM persons;
output:3

* SELECT SUM(Age) FROM Persons;
output:84

* SELECT AVG(Age) FROM persons;
output:28


