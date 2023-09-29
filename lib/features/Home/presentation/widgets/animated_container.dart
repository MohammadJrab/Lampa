import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({super.key});

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 200,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: _isExpanded ? 313 : 111,
        height: _isExpanded ? 266 : 125,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(_isExpanded ? 0.0 : 15.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              top: _isExpanded ? 8.0 : 0.0,
              right: _isExpanded ? 8.0 : 0.0,
              child: Container(
                width: _isExpanded ? 38 : 111,
                height: _isExpanded ? 43 : 125,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('images/travel.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الغربة والحاجة إلى الإندماج في المجتمعات الغربية',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'اتصلّت بي امرأة ، تركت بلدها العربي لظروف قاهرة ، لتعيش في ألمانيا منذ خمس سنوات .قالت لي : توقف الزمن عندي منذ هاجرت لأوروبا .. لم أستطع الاندماج ، وجدتُ صعوبة في تعلم اللغة ، لم أتقبّل الناس وطبائعهم ، وللأسف لا......',
                    textDirection: TextDirection.rtl,
                    maxLines: _isExpanded ? 10 : 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(_isExpanded ? 1.0 : 0.5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigate to another page
                        },
                        child: const Text('Read more'),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.favorite),
                      const SizedBox(width: 4),
                      const Text('100'),
                      const SizedBox(width: 8),
                      const Icon(Icons.comment),
                      const SizedBox(width: 4),
                      const Text('50'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
